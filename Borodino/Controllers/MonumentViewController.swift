//
//  MonumentViewController.swift
//  Borodino
//
//  Created by Александр Прайд on 06.05.2022.
//

import UIKit

class MonumentViewController: UIViewController {
    
    private lazy var sharedBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharedBarButtonPressed))
    }()
    
    lazy var mainScrollView = UIScrollView()
    lazy var upperView = UIView()
    
    lazy var publicationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: K.ImagesTitle.firstImage)
        
        return imageView
        
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont(name: "Avenir", size: 25)
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "Памятник 1-му и 19-му Егерским полкам"

        return label
    }()
    
    lazy var footerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
    
        return view
    }()
    
    lazy var goToTheMapButton: UIButton = {
        let button = UIButton()
        button.setTitle("Посмотреть на Карте", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont(name: "Avenir", size: 20)
        button.backgroundColor = .mainBlackColor()
        button.layer.cornerRadius = 5
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 10
        
        return button
    }()
    
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 17)
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.text = """

Автором белокаменной часовни с портиками дорического ордера является архитектор Борис Аркадьевич Альберти. По его проекту она была сооружена к 1912 году. Памятник посвящен двум егерским полкам, которые по приказу главнокомандующего 1-й Западной армии Барклая де Толли в решающий момент боя здесь, на правом берегу реки Колочи, были брошены на помощь лейб-егерям. Те только что оставили село Бородино под натиском превосходящих сил противника. Атака французской пехоты была отражена. Противнику, пытавшемуся прорвать оборону, был поставлен мощный заслон.

Над входом в часовню – бронзовый орел с распростертыми крыльями – символ победы. Под ним и на противоположном портике – беломраморные доски с лермонтовскими строками, начертанными золотом. На одной из них: «Не будь на то Господня воля – не отдали б Москвы», на другой – «Умереть мы обещали, и клятву верности сдержали мы в Бородинский бой». Внутри часовни – мозаичное панно «Егеря в Бородинском сражении» работы художника Александра Хлебникова, исполненное в 1981 году.
"""
        label.textColor = .mainBlackColor()
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        createUIElements()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    private func createUIElements() {
        settingsNavigationBar()
        setupScrollViewconstraints()
        setupUpperViewConstraints()
        setupImageViewConstraints()
        setupConstraintsForTitleLabel()
        setupButtonConstraints()
        setupFooterViewConstraints()
        setupContentLabelConstraints()
    }
    
    
// MARK: Setup UI Elements
    
    private func settingsNavigationBar() {
        navigationItem.title = K.NavControllerTitle.description_of_publication_title
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont(name: "Avenir", size: 20)!]
        navigationItem.rightBarButtonItem = sharedBarButtonItem
        sharedBarButtonItem.tintColor = .mainBlackColor()
    }
    
    @objc private func sharedBarButtonPressed() {
        print(#function)
    }
    
    private func setupScrollViewconstraints() {
        view.addSubview(mainScrollView)
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            mainScrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            mainScrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupUpperViewConstraints() {
        mainScrollView.addSubview(upperView)
        upperView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            upperView.centerXAnchor.constraint(equalTo: mainScrollView.centerXAnchor),
            upperView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            upperView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor),
            upperView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor)
        
        ])
        
    }
    
    private func setupImageViewConstraints() {
        upperView.addSubview(publicationImageView)
        publicationImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            publicationImageView.centerXAnchor.constraint(equalTo: upperView.centerXAnchor),
            publicationImageView.topAnchor.constraint(equalTo: upperView.topAnchor),
            publicationImageView.widthAnchor.constraint(equalTo: upperView.widthAnchor),
            publicationImageView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func setupConstraintsForTitleLabel() {
        upperView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: upperView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: publicationImageView.bottomAnchor, constant: 50),
            titleLabel.widthAnchor.constraint(equalTo: upperView.widthAnchor, multiplier: 3/4)
        ])
    }
    
    private func setupContentLabelConstraints() {
        upperView.addSubview(contentLabel)
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentLabel.centerXAnchor.constraint(equalTo: upperView.centerXAnchor),
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            contentLabel.widthAnchor.constraint(equalTo: upperView.widthAnchor, constant: -20),
            contentLabel.bottomAnchor.constraint(equalTo: upperView.bottomAnchor, constant: -80)
        ])
    }
    
    private func setupFooterViewConstraints() {
        view.addSubview(footerView)
        footerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            footerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            footerView.widthAnchor.constraint(equalTo: view.widthAnchor),
            footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            footerView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupButtonConstraints() {
        footerView.addSubview(goToTheMapButton)
        goToTheMapButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            goToTheMapButton.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 20),
            goToTheMapButton.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 19),
            goToTheMapButton.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant:  -18),
            goToTheMapButton.heightAnchor.constraint(equalToConstant: 47)
        ])
    }
    
    
}

