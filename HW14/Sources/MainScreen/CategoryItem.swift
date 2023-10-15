//
//  CategoryItem.swift
//  HW14
//
//  Created by Gabriel Zdravkovici on 14.10.2023.
//
import UIKit

class CategoryItem {
    
     var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
     var accessoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 138 / 255, green: 138 / 255, blue: 141 / 255, alpha: 1)
        return label
    }()
    
     var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    var iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    init(label: UILabel, accessoryLabel: UILabel, iconImageView: UIImageView, iconContainer: UIView) {
        //super.init(frame: frame)
        self.label = label
        self.accessoryLabel = accessoryLabel
        self.iconImageView = iconImageView
        self.iconContainer = iconContainer
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
