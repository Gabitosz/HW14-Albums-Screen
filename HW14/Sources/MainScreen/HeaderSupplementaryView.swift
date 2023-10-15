//
//  HeaderSupplementaryView.swift
//  HW14
//
//  Created by Gabriel Zdravkovici on 14.10.2023.
//

import UIKit

class HeaderSupplementaryView: UICollectionReusableView {
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private lazy var seeAllButton: UIButton = {
        let seeAllButton = UIButton()
        seeAllButton.titleLabel?.textAlignment = .center
        seeAllButton.translatesAutoresizingMaskIntoConstraints = false
        seeAllButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        seeAllButton.setTitleColor(.systemBlue, for: .normal)
        seeAllButton.addTarget(self, action: #selector(seeAllButtonTapped), for: .touchUpInside)
        return seeAllButton
    }()
    
    @objc func seeAllButtonTapped() {
        print("All button tapped")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(headerLabel)
        addSubview(seeAllButton)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHeader(sectionName: String) {
        headerLabel.text = sectionName
        seeAllButton.setTitle("Все", for: .normal)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([

            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            seeAllButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            seeAllButton.trailingAnchor.constraint(equalTo: trailingAnchor),
        
        
        
        ])
    }
}
