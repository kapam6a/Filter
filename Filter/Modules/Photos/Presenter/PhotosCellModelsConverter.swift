//
//  File.swift
//  Filter
//
//  Created by admin5 on 14.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class PhotosCellModelsConverter {
    private weak var viewOutput: PhotosViewOutput!
    
    init(withViewOutput viewOutput: PhotosViewOutput) {
        self.viewOutput = viewOutput
    }
    
    func convertModels(withPhotosEntities photosEntities: [PhotoEntity]) -> [BasicCollectionViewCellModel]{
        var cellModels: [BasicCollectionViewCellModel] = []
        
        for index in 0...7 {
            var path = ""
            var title = "add photo"
            if index < photosEntities.count {
                path = photosEntities[index].url.path
            }
            if index == 0 {
                title = "add avatar"
            }
            let cellModel = PhotosCellModel(path: path,
                                            title: title)
            cellModels.append(cellModel)
        }
        
        return cellModels
    }
}
