//
//  FilterAssembly.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

class AgeAssembly {
    func createAgeModule() -> AgeModule {
        let vc = AgeViewController()
        let presenter = AgePresenter()
        let interactor = AgeInteractor()
        let router = AgeRouter()
        
        vc.output = presenter
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = vc
        
        return presenter
    }
}
