//
//  MyAlbumsCollectionViewCell.swift
//  HW14
//
//  Created by Gabriel Zdravkovici on 14.10.2023.
//

import UIKit

class AlbumsCollectionViewCell: UICollectionViewCell {
    
    private let albumPhotoView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let albumTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberOfPhotos: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let separatorView: UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .lightGray
        return separator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        clipsToBounds = false
        addSubview(albumPhotoView)
        addSubview(albumTitle)
        addSubview(numberOfPhotos)
        addSubview(separatorView)
        
    }
    
    func configureCell(imageName: String) {
        albumPhotoView.image = UIImage(named: imageName)
       
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            albumPhotoView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            albumPhotoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            albumPhotoView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            albumPhotoView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            
            albumTitle.topAnchor.constraint(equalTo: albumPhotoView.bottomAnchor, constant: 150),
            
            numberOfPhotos.topAnchor.constraint(equalTo: albumTitle.bottomAnchor, constant: 10),
        
        ])
    }
}
