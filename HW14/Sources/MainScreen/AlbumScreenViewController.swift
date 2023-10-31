//
//  ViewController.swift
//  HW14
//
//  Created by Gabriel Zdravkovici on 11.10.2023.
//

import UIKit

class AlbumScreenViewController: UIViewController {
    
    // MARK: Outlets
    
    private let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .none
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let separatorView: UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .blue
        return separator
    }()
    
    private let sections = DataSource.shared.data
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setDelegates()
        setConstraints()
        //   setupCollectionView()
        
    }
    
    // MARK: Setup
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Альбомы"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
    }
    
    
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        view.addSubview(separatorView)
        
        collectionView.register(AlbumsCollectionViewCell.self, forCellWithReuseIdentifier: "MyAlbumsCollectionViewCell")
        collectionView.register(AlbumsCollectionViewCell.self, forCellWithReuseIdentifier: "SharedAlbumsCollectionViewCell")
        collectionView.register(CategoryItemCell.self, forCellWithReuseIdentifier: "CategoryItemViewCell")
        collectionView.register(HeaderSupplementaryView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderSupplementaryView")
        
        collectionView.collectionViewLayout = createLayout()
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    //    private func setupCollectionView() {
    //
    //        collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
    //
    //        if let collection = collectionView {
    //            view.addSubview(collection)
    //
    //            collection.translatesAutoresizingMaskIntoConstraints = false
    //            NSLayoutConstraint.activate([
    //                collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
    //                collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    //                collection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
    //                collection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
    //            ])
    //            collection.dataSource = self
    //
    //            collection.register(PhotoCell.self, forCellWithReuseIdentifier: "\(PhotoCell.self)")
    //
    //
    //        }
    //
    //    }
    //
    //    private func setupFlowLayout() -> UICollectionViewFlowLayout {
    //        let layout = UICollectionViewFlowLayout()
    //        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    //        layout.scrollDirection = .horizontal
    //        layout.minimumLineSpacing = 5
    //        layout.minimumInteritemSpacing = 20
    //        layout.sectionInset = .init(top: 30, left: 30, bottom: 30, right: 30)
    //        return layout
    //    }
}


extension AlbumScreenViewController {
    private func createLayout() -> UICollectionViewCompositionalLayout {
        
        UICollectionViewCompositionalLayout { [weak self] sectionindex , _ in
            guard let self = self else { return nil }
            let section = self.sections[sectionindex]
            switch section {
            case .myAlbums(_):
                return createAlbumsSection()
            case .sharedAlbums(_):
                return createSharedSection()
            case .mediaTypes(_):
                return createMediaTypesSection()
            case .utilities(_):
                return createUtilitiesTypesSection()
            }
            
        }
    }
    
//    private func createLayoutSection(group: NSCollectionLayoutGroup, behaviour: UICollectionLayoutSectionOrthogonalScrollingBehavior, interGroupSpacing: CGFloat, supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem] ) -> NSCollectionLayoutSection {
//        let section = NSCollectionLayoutSection(group: group)
//        section.orthogonalScrollingBehavior = behaviour
//        section.interGroupSpacing = interGroupSpacing
//        section.boundarySupplementaryItems = supplementaryItems
//        return section
//    }
    
    private func createAlbumsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 40, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(1.2))
        
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)
        layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 10)
        
        let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
        sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5)
        sectionLayout.orthogonalScrollingBehavior = .groupPaging
        
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(30))
        
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        sectionLayout.boundarySupplementaryItems = [layoutSectionHeader]
        
        return sectionLayout
        
        
        //        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        //
        //        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalHeight(0.4)), repeatingSubitem: item, count: 2)
        //        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
        //        group.interItemSpacing = .fixed(40)
        //
        //        let section = createLayoutSection(group: group, behaviour: .continuous, interGroupSpacing: 10, supplementaryItems: [supplementaryHeaderItem()])
        //        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 5)
        //        section.orthogonalScrollingBehavior = .groupPaging
        //        return section
    }
    
    private func createSharedSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(0.5))
        
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])
        layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 10)
        
        let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
        sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 40, trailing: 5)
        sectionLayout.orthogonalScrollingBehavior = .groupPaging
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(30))
        
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        sectionLayout.boundarySupplementaryItems = [layoutSectionHeader]

        return sectionLayout
    }
    
    private func createMediaTypesSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40))
        
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])
        
        let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
        sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 17, trailing: 17)
        
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(60))
        
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        sectionLayout.boundarySupplementaryItems = [layoutSectionHeader]
        
        return sectionLayout
        
        
    }
    
    private func createUtilitiesTypesSection() -> NSCollectionLayoutSection {

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40))
        
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])
        
        let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
        sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 17, trailing: 17)
        
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(50))
        
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        sectionLayout.boundarySupplementaryItems = [layoutSectionHeader]
        
        return sectionLayout
        
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
}



extension AlbumScreenViewController: UICollectionViewDelegate {
    
}

extension AlbumScreenViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].countOfSections
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch sections[indexPath.section] {
            
        case .myAlbums(let album):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyAlbumsCollectionViewCell", for: indexPath) as? AlbumsCollectionViewCell
            else {
                return UICollectionViewCell()
            }

            for subview in cell.contentView.subviews {
                subview.removeFromSuperview()
            }
                    
            cell.configureCell(imageName: album[indexPath.row].image)
            let albumTitle = UILabel(frame: CGRect(x: 0, y: 180, width: cell.bounds.size.width, height: 30))
            albumTitle.text = album[indexPath.row].title
            cell.contentView.addSubview(albumTitle)
            
            if album[indexPath.row].title == "Избранное" {
                let imageView = UIImageView()
                imageView.tintColor = .white
                imageView.image = UIImage(systemName: "heart.fill")
                imageView.translatesAutoresizingMaskIntoConstraints = false
                cell.contentView.addSubview(imageView)
                NSLayoutConstraint.activate([
                    imageView.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: -5),
                    imageView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 5),
                    imageView.widthAnchor.constraint(equalToConstant: 20),
                    imageView.heightAnchor.constraint(equalToConstant: 20)
                ])
            } else {
                for subview in view.subviews {
                    if let imageView = subview as? UIImageView {
                        imageView.removeFromSuperview()
                    }
                }
            }
            
            let numberOfPhotos = UILabel(frame: CGRect(x: 2, y: 200, width: cell.bounds.size.width, height: 30))
            numberOfPhotos.text = album[indexPath.row].countOfPhotos?.description
            numberOfPhotos.textColor = .gray
            cell.contentView.addSubview(numberOfPhotos)
            
            return cell
            
        case .sharedAlbums(let sharedAlbum):
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SharedAlbumsCollectionViewCell", for: indexPath) as? AlbumsCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            for subview in cell.contentView.subviews {
                subview.removeFromSuperview()
            }
            
            cell.configureCell(imageName: sharedAlbum[indexPath.row].image)
            let albumTitle = UILabel(frame: CGRect(x: 2, y: 180, width: cell.bounds.size.width, height: 50))
            albumTitle.text = sharedAlbum[indexPath.row].title
            cell.contentView.addSubview(albumTitle)
            
            return cell
            
        case .mediaTypes(let mediaTypes):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryItemViewCell", for: indexPath) as? CategoryItemCell
            else {
                return UICollectionViewCell()
            }
            
            cell.configureCell(labelName: mediaTypes[indexPath.row].title,
                               numberElements: mediaTypes[indexPath.row].numberOfElements,
                               image: mediaTypes[indexPath.row].image)
//            
            
//            let mediaTypesTitle = UILabel(frame: CGRect(x: 130, y: 50, width: cell.bounds.size.width, height: 50))
//            mediaTypesTitle.text = mediaTypes[indexPath.row].title
//            cell.contentView.addSubview(mediaTypesTitle)
            return cell
            
        case .utilities(let utilitiesTypes):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryItemViewCell", for: indexPath) as? CategoryItemCell
            else {
                return UICollectionViewCell()
            }
            
            cell.configureCell(labelName: utilitiesTypes[indexPath.row].title,
                               numberElements: utilitiesTypes[indexPath.row].numberOfElements,
                               image: utilitiesTypes[indexPath.row].image)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderSupplementaryView", for: indexPath) as? HeaderSupplementaryView
            if let header = header {
                header.configureHeader(sectionName: sections[indexPath.section].title)
                if indexPath.section < 2 {
                    header.showSeeAllButton()
                } else {
                    header.hideSeeAllButton()
                }
                    
                return header

            }
            
        default:
            return UICollectionReusableView()
        }
        return UICollectionReusableView()
    }
}

extension AlbumScreenViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 7),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            
            separatorView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: 10),
            separatorView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor,constant: 10),
            separatorView.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: -20),
            separatorView.heightAnchor.constraint(equalToConstant: 2),
            separatorView.widthAnchor.constraint(equalToConstant: 320),
        ])
    }
}




