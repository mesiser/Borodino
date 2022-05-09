//
//  GalleryCell.swift
//  Borodino
//
//  Created by Александр Прайд on 04.05.2022.
//

import UIKit

class GalleryCell: UICollectionViewCell {
    
    static let galleryIDCell = K.gallery_ID_cell
    
    let galleryImageView = UIImageView()
    let backView = UIView()
    let titleLabel = UILabel()
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        createGalleryCellView()
        createBackView()
        createTitleLabel()
    }
    
    //MARK: Setup UI elements
    
    private func createGalleryCellView() {
        
        addSubview(galleryImageView)
        galleryImageView.translatesAutoresizingMaskIntoConstraints = false
        setupConstraintsForGalleryCellView()
        galleryImageView.clipsToBounds = true
        
    }
    
    private func setupConstraintsForGalleryCellView() {
        
        NSLayoutConstraint.activate([
            galleryImageView.topAnchor.constraint(equalTo: self.topAnchor),
            galleryImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            galleryImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            galleryImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        ])
    }
    
    // backView
    private func createBackView() {
        
        galleryImageView.addSubview(backView)
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.clipsToBounds = true
        backView.backgroundColor = .clear
        setupConstraintsForBackView()
    
    }
    
    private func setupConstraintsForBackView() {
        
        NSLayoutConstraint.activate([
            backView.leadingAnchor.constraint(equalTo: galleryImageView.leadingAnchor, constant: 2),
            backView.trailingAnchor.constraint(equalTo: galleryImageView.trailingAnchor, constant: -2),
            backView.bottomAnchor.constraint(equalTo: galleryImageView.bottomAnchor, constant: 1),
            backView.heightAnchor.constraint(equalToConstant: 70)
        
        ])
        
    }
    
    // titleLabel
    private func createTitleLabel() {
        backView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .left
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "Avenir", size: 15)
        
        setupConstraintsForTitleView()
    }
    
    private func setupConstraintsForTitleView() {
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: backView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor)
        
        ])
        
        
    }
    
}
