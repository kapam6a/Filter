//
//  FilterAssembly.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

class NewInterestsAssembly {
    func createNewInterestsModule() -> NewInterestsModule {
        let vc = NewInterestsViewController()
        let presenter = NewInterestsPresenter()
        let interactor = NewInterestsInteractor(withInterestsService: ServiceAssembly.createInterestsService())
        let router = NewInterestsRouter()
        
        vc.output = presenter
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = vc
        
        return presenter
    }
}
