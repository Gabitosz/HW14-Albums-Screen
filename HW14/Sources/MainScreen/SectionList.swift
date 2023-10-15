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
    //    case mediaTypes([CategoryItem])
    //    case utilities([CategoryItem])
    
    // попробовать сделать тоже самое с списком
    var photoItems: [PhotoItem] {
        switch self {
        case .myAlbums(let photoItems),
                .sharedAlbums(let photoItems):
            return photoItems
        }
    }
    
    //    var categoryItems: [CategoryItem] {
    //        switch self {
    //        case .mediaTypes(let categoryItems),
    //                .utilities(let categoryItems):
    //            return categoryItems
    //        default: return []
    //        }
    //    }
    
    var countOfSections: Int {
        let totalCount = photoItems.count //+ categoryItems.count
        return totalCount
    }
    
    var title: String {
        switch self {
        case .myAlbums(_):
            return "My Albums"
        case .sharedAlbums(_):
            return "Shared Albums"
            //        case .mediaTypes(_):
            //            return "Media Types"
            //        case .utilities(_):
            //            return "Utilities"
            //        }
        }
    }
}
