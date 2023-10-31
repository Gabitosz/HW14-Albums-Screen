//
//  SectionList.swift
//  HW14
//
//  Created by Gabriel Zdravkovici on 14.10.2023.
//

import Foundation

enum SectionList {
    case myAlbums([PhotoItem])
    case sharedAlbums([PhotoItem])
    case mediaTypes([CategoryItem])
    case utilities([CategoryItem])
    
    var photoItems: [PhotoItem] {
        switch self {
        case .myAlbums(let photoItems),
                .sharedAlbums(let photoItems):
            return photoItems
        default : return []
        }
    }
    
    var categoryItems: [CategoryItem] {
        switch self {
        case .mediaTypes(let mediaItems):
            return mediaItems
        case .utilities(let utilitiesItems):
            return utilitiesItems
        default: return []
        }
    }
    
    var countOfSections: Int {
        let totalCount = photoItems.count + categoryItems.count
        return totalCount
    }
    
    var title: String {
        switch self {
        case .myAlbums(_):
            return "Мои Альбомы"
        case .sharedAlbums(_):
            return "Общие Альбомы"
        case .mediaTypes(_):
            return "Типы медиафайлов"
        case .utilities(_):
            return "Другое"
        }
    }
}

