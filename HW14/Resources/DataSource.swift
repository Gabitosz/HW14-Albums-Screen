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
            .init(title: "Недавние", image: "photo1", countOfPhotos: "14,154"),
            .init(title: "Избранное", image: "photo2", countOfPhotos: "213"),
            .init(title: "Instagram", image: "photo3", countOfPhotos: "3,122"),
            .init(title: "Snapchat", image: "photo4", countOfPhotos: "122"),
            .init(title: "WhatsApp", image: "photo5", countOfPhotos: "931"),
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
    
    private let mediaTypes: SectionList = {
        .mediaTypes([
            CategoryItem(title: "Видео", image: "video", numberOfElements: "4,124"),
            CategoryItem(title: "Селфи", image: "person.crop.square", numberOfElements: "2,131"),
            CategoryItem(title: "Фото Live Photos", image: "livephoto", numberOfElements: "122"),
            CategoryItem(title: "Портреты", image: "cube", numberOfElements: "3,122"),
            CategoryItem(title: "Панорамы", image: "pano", numberOfElements: "21"),
            CategoryItem(title: "Замедленно", image: "slowmo", numberOfElements: "101"),
            CategoryItem(title: "Серии", image: "square.stack.3d.down.right", numberOfElements: "21"),
            CategoryItem(title: "Снимки экрана", image: "camera.viewfinder", numberOfElements: "441"),
            CategoryItem(title: "Записи экрана", image: "record.circle", numberOfElements: "221"),
            CategoryItem(title: "Анимированные", image: "square.stack.3d.forward.dottedline.fill", numberOfElements: "2,123"),
        ])
    }()
    
    private let utilitiesTypes: SectionList = {
        .utilities([
            CategoryItem(title: "Импортированные", image: "square.and.arrow.down", numberOfElements: "1,221"),
            CategoryItem(title: "Дубликаты", image: "square.on.square", numberOfElements: "104"),
            CategoryItem(title: "Скрытые", image: "eye.slash", numberOfElements: "452"),
            CategoryItem(title: "Недавно удаленные", image: "trash", numberOfElements: "142"),
        ])
    }()
    
    var data: [SectionList] {
        [myAlbums, sharedAlbums, mediaTypes, utilitiesTypes]
    }
}
