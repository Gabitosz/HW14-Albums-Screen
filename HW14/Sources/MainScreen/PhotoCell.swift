//
//  PhotoCell.swift
//  HW14
//
//  Created by Gabriel Zdravkovici on 14.10.2023.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    var imageView = UIImageView()
//    let cellName = UILabel ()
//    let numberOfPhotos = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.layer.cornerRadius = 30
        self.contentView.addSubview(imageView)
//        self.contentView.addSubview(cellName)
//        self.contentView.addSubview(numberOfPhotos)
    
//        cellName.translatesAutoresizingMaskIntoConstraints = false
//        numberOfPhotos.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        
        NSLayoutConstraint.activate([
//            imageView.widthAnchor.constraint(equalToConstant: 150),
//            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
        
    }
}
