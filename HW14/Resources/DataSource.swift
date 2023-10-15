//
//  PhotoSource.swift
//  HW14
//
//  Created by Gabriel Zdravkovici on 14.10.2023.
//

import UIKit

struct DataSource {
    
    static let shared = DataSource()
    
    private let myAlbums: SectionList = {
        .myAlbums([
            .init(title: "Недавние", image: "photo1", countOfPhotos: 14.154),
            .init(title: "Избранное", image: "photo2", countOfPhotos: 0),
            .init(title: "Instagram", image: "photo3", countOfPhotos: 0),
            .init(title: "Snapchat", image: "photo4", countOfPhotos: 0),
            .init(title: "WhatsApp", image: "photo5", countOfPhotos: 0),
        ])
    }()
    
    private let sharedAlbums: SectionList = {
        .sharedAlbums([
            .init(title: "Shared1", image: "photo6", countOfPhotos: nil),
            .init(title: "Shared2", image: "photo7", countOfPhotos: nil),
            .init(title: "Shared3", image: "photo8", countOfPhotos: nil),
            .init(title: "Shared4", image: "photo9", countOfPhotos: nil),
        ])
    }()
    
//    private let mediaTypes: SectionList = {
//        .mediaTypes([
//            CategoryItem(label: "Авиарежим", accessoryLabel: "0", iconImageView: UIImage(systemName: "airplane"), iconContainer: UIColor(red: 240 / 255, green: 154 / 255, blue: 54 / 255, alpha: 1)),
//                        
//                         ]
//            )
//    }()
    
    var data: [SectionList] {
        [myAlbums, sharedAlbums]
    }
    
    
    
    
    struct Photo {
        let id: Int
        let imageName: String
    }
    
    struct AlbumSectionPhotos {
        let sectionName: String
        var photos: [Photo]
    }
}
