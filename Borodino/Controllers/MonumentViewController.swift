//
//  MonumentViewController.swift
//  Borodino
//
//  Created by Александр Прайд on 06.05.2022.
//

import UIKit

class MonumentViewController: UIViewController {
    
    // properties
    private lazy var sharedBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharedBarButtonPressed))
    }()
    
    lazy var mainScrollView = UIScrollView()
    lazy var upperView = UIView()
    
    lazy var monumentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
        return imageView
        
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont(name: "Avenir", size: 25)
        label.font = UIFont.boldSystemFont(ofSize: 25)

        return label
    }()
    
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 17)
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.textColor = .mainBlackColor()
        
        return label
    }()
    
    lazy var footerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
    
        return view
    }()
    
    lazy var goToTheMapButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Посмотреть на Карте", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 20)
        button.backgroundColor = .mainBlackColor()
        button.layer.cornerRadius = 5
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 2
        
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUIElements()
        
        tabBarController?.tabBar.isHidden = true
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @objc private func sharedBarButtonPressed() {
        print(#function)
    }
}

// MARK: - Setup UI Elements
extension MonumentViewController {
    
    private func setupUIElements() {

        #warning("Лучше делать single responsibility. Сначала добавляешь все вью, потом расставляешь коснтрейнты")
        
        view.addSubview(mainScrollView)
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        #warning("Чтобы не писать десять раз translatesAutoresizingMaskIntoConstraints = false, я бы подумал сделать общий клаcc  и делать translatesAutoresizingMaskIntoConstraints = false в нем и после этого наследовать у него. Но лучше использовать SnapKit :)")

        upperView.addSubview(contentLabel)
        contentLabel.translatesAutoresizingMaskIntoConstraints = false

        mainScrollView.addSubview(upperView)
        upperView.translatesAutoresizingMaskIntoConstraints = false

        upperView.addSubview(monumentImageView)
        monumentImageView.translatesAutoresizingMaskIntoConstraints = false

        upperView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(footerView)
        footerView.translatesAutoresizingMaskIntoConstraints = false

        footerView.addSubview(goToTheMapButton)
        goToTheMapButton.translatesAutoresizingMaskIntoConstraints = false
        
        setupNavigationBar()
        setupUpperViewConstraints()
        setupImageViewConstraints()
        setupConstraintsForTitleLabel()
        setupButtonConstraints()
        setupFooterViewConstraints()
        setupScrollViewconstraints()
        setupContentLabelConstraints()
    }
    
    private func setupNavigationBar() {

        //title = K.NavControllerTitle.description_of_publication_title
        #warning("Надо black, а то ниче не видно 😎")
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont(name: "Avenir", size: 20)!]
        
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationItem.rightBarButtonItem = sharedBarButtonItem
        sharedBarButtonItem.tintColor = .mainBlackColor()
        
    }
    
    private func setupScrollViewconstraints() {
        
        #warning("I would recommend you to try snap kit for constraints")
        //The one below👇 you easily could write with snapkit like this:
        //mainScrollView.snp.makeContstraints {
        //    $0.top.width.bottom.centerX.equalToSuperview()
        //}
        
        #warning("Надо делать topAnchor от safe area, а bottomAnchor от footerView. Иначе скролл вью обрезается")
        NSLayoutConstraint.activate([
            mainScrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainScrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: footerView.bottomAnchor, constant: -20)
        ])
    }
    
    private func setupUpperViewConstraints() {

        NSLayoutConstraint.activate([
            upperView.centerXAnchor.constraint(equalTo: mainScrollView.centerXAnchor),
            upperView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            upperView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor),
            upperView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor)
        
        ])
        
    }
    
    private func setupImageViewConstraints() {
 
        NSLayoutConstraint.activate([
            monumentImageView.centerXAnchor.constraint(equalTo: upperView.centerXAnchor),
            monumentImageView.topAnchor.constraint(equalTo: upperView.topAnchor),
            monumentImageView.widthAnchor.constraint(equalTo: upperView.widthAnchor),
            monumentImageView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func setupConstraintsForTitleLabel() {
 
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: upperView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: monumentImageView.bottomAnchor, constant: 50),
            titleLabel.widthAnchor.constraint(equalTo: upperView.widthAnchor, multiplier: 3/4)
        ])
    }
    
    private func setupContentLabelConstraints() {
 
        NSLayoutConstraint.activate([
            contentLabel.centerXAnchor.constraint(equalTo: upperView.centerXAnchor),
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            contentLabel.widthAnchor.constraint(equalTo: upperView.widthAnchor, constant: -20),
            contentLabel.bottomAnchor.constraint(equalTo: upperView.bottomAnchor, constant: -80)
        ])
    }
    
    private func setupFooterViewConstraints() {
 
        NSLayoutConstraint.activate([
            footerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            footerView.widthAnchor.constraint(equalTo: view.widthAnchor),
            footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            footerView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupButtonConstraints() {
 
        NSLayoutConstraint.activate([
            goToTheMapButton.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 20),
            goToTheMapButton.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 19),
            goToTheMapButton.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant:  -18),
            goToTheMapButton.heightAnchor.constraint(equalToConstant: 47)
        ])
    }
    
}

