//
//  PhotoSource.swift
//  HW14
//
//  Created by Gabriel Zdravkovici on 14.10.2023.
//


struct PhotoSource {
    
    static let myAlbumsSection: [Photo] = [
        .init(id: 1, imageName: "photo1"),
        .init(id: 2, imageName: "photo2"),
        .init(id: 3, imageName: "photo3"),
        .init(id: 4, imageName: "photo4"),
        .init(id: 5, imageName: "photo5"),
        .init(id: 6, imageName: "photo6"),
        .init(id: 7, imageName: "photo7"),
        .init(id: 8, imageName: "photo8"),
        .init(id: 9, imageName: "photo9"),
        .init(id: 10, imageName: "photo10"),
    ]
    
    static let sharedAlbumsSection: [Photo] = [
        .init(id: 1, imageName: "photo1"),
        .init(id: 2, imageName: "photo2"),
        .init(id: 3, imageName: "photo3"),
        .init(id: 4, imageName: "photo4"),
        .init(id: 5, imageName: "photo5"),
        .init(id: 6, imageName: "photo6"),
        .init(id: 7, imageName: "photo7"),
        .init(id: 8, imageName: "photo8"),
        .init(id: 9, imageName: "photo9"),
        .init(id: 10, imageName: "photo10"),
    
    ]
    
    
    static func allPhotos(section: String) -> [Photo] {
        switch section {
        case "My Albums":
            return myAlbumsSection
        case "Shared Albums":
            return sharedAlbumsSection
        default:
            return []
        }
    }
    
}

struct Photo {
    let id: Int
    let imageName: String
}

struct AlbumSectionPhotos {
    let sectionName: String
    var photos: [Photo]
}
