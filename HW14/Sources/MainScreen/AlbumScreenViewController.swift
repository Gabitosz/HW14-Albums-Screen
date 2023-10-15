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
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .none
        collectionView.bounces = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let sections = DataSource.shared.data
    
    //  let photos: [Photo] = PhotoSource.allPhotos()
    
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setDelegates()
        setConstraints()
        //   setupCollectionView()
        
    }
    
    // MARK: Setup
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "Albums"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        view.addSubview(collectionView)
        
        collectionView.register(AlbumsCollectionViewCell.self, forCellWithReuseIdentifier: "MyAlbumsCollectionViewCell")
        collectionView.register(AlbumsCollectionViewCell.self, forCellWithReuseIdentifier: "SharedAlbumsCollectionViewCell")
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
                }
            }
        }
    
    private func createLayoutSection(group: NSCollectionLayoutGroup, behaviour: UICollectionLayoutSectionOrthogonalScrollingBehavior, interGroupSpacing: CGFloat, supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem] ) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behaviour
        section.interGroupSpacing = interGroupSpacing
        section.boundarySupplementaryItems = supplementaryItems
        return section
    }
    
    private func createAlbumsSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalHeight(0.3)), subitems: [item])
        
        let section = createLayoutSection(group: group, behaviour: .continuous, interGroupSpacing: 10, supplementaryItems: [supplementaryHeaderItem()])
        section.contentInsets = .init(top: 10, leading: 10, bottom: 100, trailing: 15)
        
        return section
    }
    
    private func createSharedSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.9)))
        
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalHeight(0.3)), subitems: [item])

        
        let section = createLayoutSection(group: group, behaviour: .continuous, interGroupSpacing: 10, supplementaryItems: [supplementaryHeaderItem()])
        section.contentInsets = .init(top: 10, leading: 10, bottom: 0, trailing: 15)
    
        return section
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(30)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
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
            cell.configureCell(imageName: album[indexPath.row].image)
            let albumTitle = UILabel(frame: CGRect(x: 0, y: 160, width: cell.bounds.size.width, height: 50))
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
            
                
                
            }
            
            let numberOfPhotos = UILabel(frame: CGRect(x: 2, y: 190, width: cell.bounds.size.width, height: 30))
            numberOfPhotos.text = album[indexPath.row].countOfPhotos?.description
            numberOfPhotos.textColor = .gray
            cell.contentView.addSubview(numberOfPhotos)
            
            return cell
            
        case .sharedAlbums(let sharedAlbum):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SharedAlbumsCollectionViewCell", for: indexPath) as? AlbumsCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: sharedAlbum[indexPath.row].image)
            let albumTitle = UILabel(frame: CGRect(x: 0, y: 170, width: cell.bounds.size.width, height: 50))
            albumTitle.text = sharedAlbum[indexPath.row].title
            cell.contentView.addSubview(albumTitle)
            return cell
        
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderSupplementaryView", for: indexPath) as? HeaderSupplementaryView
            if let header = header {
                header.configureHeader(sectionName: sections[indexPath.section].title)
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
        ])
    }
}




