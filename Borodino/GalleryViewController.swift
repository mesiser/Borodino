//
//  ViewController.swift
//  Borodino
//
//  Created by Александр Прайд on 04.05.2022.
//

import UIKit

class GalleryViewController: UIViewController {

    var collectionView: UICollectionView! = nil
    
    let sampleData = [GalleryModel(image: UIImage(named: K.ImagesTitle.firstImage), description: "Памятник 1-му и 19-му Егерским полкам"),
                      GalleryModel(image: UIImage(named: K.ImagesTitle.secondImage), description: "Памятник 2-й конной батарее лейб-гвардии Артиллерийской бригады капитана А. Ф. Ралля"),
                      GalleryModel(image: UIImage(named: K.ImagesTitle.thirdImage), description: "Памятник лейб-гвардии Казачьему полку"),
                      GalleryModel(image: UIImage(named: K.ImagesTitle.fourthImage), description: "Памятник 7-й пехотной дивизии генерала П. М. Капцевича"),
                      GalleryModel(image: UIImage(named: K.ImagesTitle.fifthImage), description: "Памятник Нежинскому драгунскому полку")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsNavigationBar()
        createCollectionView()
        
    }

    private func settingsNavigationBar() {
        navigationItem.title = K.NavControllerTitle.gallery_title
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
       
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        if #available(iOS 11.0, *) {
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
        return sampleData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.gallery_ID_cell, for: indexPath) as! GalleryCell
        
        cell.galleryImageView.image = sampleData[indexPath.item].image
        return cell
    }
}

// MARK: CollectionViewDelegateFlowLayout
extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width - 2
        
        return CGSize(width: width, height: 250)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
