//
//  ViewController.swift
//  Borodino
//
//  Created by Александр Прайд on 04.05.2022.
//

import UIKit

class GalleryViewController: UIViewController {

    var collectionView: UICollectionView! = nil
    
    let monuments = Bundle.main.decode([Monument].self, from: "monuments.json")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsNavigationBar()
        createCollectionView()
        
    }

    private func settingsNavigationBar() {
        navigationItem.title = K.NavControllerTitle.gallery_title
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont(name: "Avenir", size: 20)!]
        
        
        
        
        if #available(iOS 13.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
    }
    
    // Setup CollectionView
    private func createCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
       
        collectionView.backgroundColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(GalleryCell.self, forCellWithReuseIdentifier: K.gallery_ID_cell)
        
        setupCollectionViewConstraints()
        
    }
    
    private func setupCollectionViewConstraints() {
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    

}

//MARK: CollectionViewDelegate, CollectionViewDataSource
extension GalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return monuments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.gallery_ID_cell, for: indexPath) as! GalleryCell
        
        cell.galleryImageView.image = UIImage(named: monuments[indexPath.item].image)
        cell.titleLabel.text = monuments[indexPath.item].title
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let monumentVC = MonumentViewController()
        monumentVC.publicationImageView.image = UIImage(named: monuments[indexPath.item].image)
        monumentVC.titleLabel.text = monuments[indexPath.item].title
        monumentVC.contentLabel.text = monuments[indexPath.item].content
        
        navigationController?.pushViewController(monumentVC, animated: true)
    }
}

// MARK: CollectionViewDelegateFlowLayout
extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        
        return CGSize(width: width, height: 250)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
