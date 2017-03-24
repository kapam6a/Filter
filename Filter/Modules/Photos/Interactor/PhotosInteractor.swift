//
//  File.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

protocol PhotosInteractorInput {
    func requestPhotos()
}

protocol PhotosInteractorOutput:class {
    func interactorRequestDidFinish(withSuccess photosEntities: [PhotoEntity])
    func interactorRequestDidFail(withError error: Error)
}

class PhotosInteractor: PhotosInteractorInput {
    weak var output: PhotosInteractorOutput!
    
    private let photosService: PhotosService
    
    init(withPhotosService photosService: PhotosService) {
        self.photosService = photosService
    }
    
    //MARK : PhotosInteractorInput
    
    func requestPhotos() {
        photosService.requestPhotos(successful: { photosEntities in
            self.output.interactorRequestDidFinish(withSuccess: photosEntities)
        }, failed: { (error) in
            self.output.interactorRequestDidFail(withError: error)
        })
    }
}
