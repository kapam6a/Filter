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
    
    func convertModels(withPhotosEntities photosEntities: [PhotoEntity]) -> [PhotosCellModel]{
        var cellModels: [PhotosCellModel] = []
        
        photosEntities.forEach { photosEntity in
            let photosCellModel = PhotosCellModelImpl(path: photosEntity.url.path)
            cellModels.append(photosCellModel)
        }

        return cellModels
    }
}
