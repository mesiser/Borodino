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
    
}
