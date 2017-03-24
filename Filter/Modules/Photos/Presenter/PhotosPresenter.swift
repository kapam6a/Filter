//
//  FilterPresenter.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol PhotosModule: class {
    var viewController: UIViewController { get }
    func configure(doneHandler: @escaping () -> Void)
}

class PhotosPresenter: PhotosViewOutput, PhotosModule, PhotosInteractorOutput {
    var view: PhotosViewInput!
    var interactor: PhotosInteractorInput!
    var router: PhotosRouterInput!
    
    private var doneHandler: (() -> Void)!
    
    //MARK : PhotosModule
    
    var viewController: UIViewController {
        return view as! UIViewController
    }
    
    func configure(doneHandler: @escaping () -> Void) {
        self.doneHandler = doneHandler
    }
    
    private var cellModelsConverter: PhotosCellModelsConverter!
    
    init() {
        cellModelsConverter = PhotosCellModelsConverter(withViewOutput: self)
    }
    
    //MARK : PhotosViewOutput
    
    func viewDidLoad() {
        interactor.requestPhotos()
    }
    
    func viewDidTapCloseButton() {
        router.closeModule()
    }
    
     //MARK : PhotosInteractorOutput
    
    func interactorRequestDidFinish(withSuccess photosEntities: [PhotoEntity]) {
        let models = cellModelsConverter.convertModels(withPhotosEntities: photosEntities)
        view.update(withCellModels: models)
    }
    
    func interactorRequestDidFail(withError error: Error) {
        
    }
}



