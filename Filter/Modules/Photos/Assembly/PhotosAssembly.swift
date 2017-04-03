//
//  FilterAssembly.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

class PhotosAssembly {
    func createPhotosModule() -> PhotosModule {
        let vc = PhotosViewController()
        let presenter = PhotosPresenter()
        let interactor = PhotosInteractor(withPhotosService: ServiceAssembly.createPhotosService())
        let router = PhotosRouter()
        
        vc.output = presenter
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = vc
        
        return presenter
    }
}
