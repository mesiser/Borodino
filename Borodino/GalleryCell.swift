//
//  GalleryCell.swift
//  Borodino
//
//  Created by Александр Прайд on 04.05.2022.
//

import UIKit

class GalleryCell: UICollectionViewCell {
    
    static let galleryIDCell = K.gallery_ID_cell
    
    private let galleryCellView = UIView()
    private let photoImageView = UIImageView()
    private let titleLabel = UILabel()
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(galleryCellView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup UI elements
    
    
}
