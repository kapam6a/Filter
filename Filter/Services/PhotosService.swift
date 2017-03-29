//
//  File.swift
//  Filter
//
//  Created by admin5 on 21.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

struct PhotoEntity {
    let url: URL
}

protocol PhotosService {
    func requestPhotos(successful: @escaping ([PhotoEntity]) -> Void, failed: @escaping (Error) -> Void)
}

class PhotosServiceImplementation: PhotosService {
    func requestPhotos(successful: @escaping ([PhotoEntity]) -> Void, failed: @escaping (Error) -> Void) {
        var photosEntities: [PhotoEntity] = []

        let photoURL1 = URL(fileURLWithPath: "/Users/admin/Desktop/Filter/Filter/1.jpg")
        photosEntities.append(PhotoEntity(url: photoURL1))
        
        let photoURL2 = URL(fileURLWithPath: "/Users/admin/Desktop/Filter/Filter/2.jpg")
        photosEntities.append(PhotoEntity(url: photoURL2))
        
        let photoURL3 = URL(fileURLWithPath: "/Users/admin/Desktop/Filter/Filter/3.jpg")
        photosEntities.append(PhotoEntity(url: photoURL3))
        
        let photoURL4 = URL(fileURLWithPath: "/Users/admin/Desktop/Filter/Filter/4.jpg")
        photosEntities.append(PhotoEntity(url: photoURL4))
        
        let photoURL5 = URL(fileURLWithPath: "/Users/admin/Desktop/Filter/Filter/5.jpg")
        photosEntities.append(PhotoEntity(url: photoURL5))
        
        let photoURL6 = URL(fileURLWithPath: "/Users/admin/Desktop/Filter/Filter/1.jpg")
         photosEntities.append(PhotoEntity(url: photoURL6))
        
        let photoURL7 = URL(fileURLWithPath: "/Users/admin/Desktop/Filter/Filter/2.jpg")
        photosEntities.append(PhotoEntity(url: photoURL7))
        
        let photoURL8 = URL(fileURLWithPath: "/Users/admin/Desktop/Filter/Filter/3.jpg")
        photosEntities.append(PhotoEntity(url: photoURL8))
 
        successful(photosEntities)
    }
}
