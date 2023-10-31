//
//  CategoryItem.swift
//  HW14
//
//  Created by Gabriel Zdravkovici on 14.10.2023.
//
import UIKit

class CategoryItemCell: UICollectionViewCell {
    
    static let identifier = "CategoryItemViewCell"
    
    var label: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        return label
    }()
    
    let accessoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "arrow")
        return imageView
    }()
    
    var numberOfElements: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    
    var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let separatorView: UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .lightGray
        return separator
    }()
    
    func setupView() {
        addSubview(label)
        addSubview(numberOfElements)
        addSubview(iconImageView)
        addSubview(accessoryImageView)
        addSubview(separatorView)
        
    }
    
    func setupLayout() {
        super.layoutSubviews()
        let size = contentView.frame.size.height - 12
        let imageSize: CGFloat = size / 0.7
        iconImageView.frame = CGRect(x: 5, y: 0, width: imageSize, height: imageSize)
        iconImageView.tintColor = .systemBlue
        accessoryImageView.frame = CGRect(x: 340, y: 8, width: 15, height: 15)
        label.frame = CGRect(x: 20 + iconImageView.frame.size.width, y: -2, width: contentView.frame.width - 20 - iconImageView.frame.size.width, height: contentView.frame.size.height)
        numberOfElements.frame = CGRect(x: 115 + iconImageView.frame.size.width, y: 0, width: contentView.frame.width - 5 - iconImageView.frame.size.width, height: contentView.frame.size.height)
    }
    
    func setup() {
        NSLayoutConstraint.activate([
            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 47),
            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: 35),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            separatorView.heightAnchor.constraint(equalToConstant: 0.5),
            separatorView.widthAnchor.constraint(equalToConstant: 320),
            
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupView()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(labelName: String, numberElements: String, image: String) {
        label.text = labelName
        numberOfElements.text = numberElements.description
        iconImageView.image = UIImage(systemName: image)
    }
}
