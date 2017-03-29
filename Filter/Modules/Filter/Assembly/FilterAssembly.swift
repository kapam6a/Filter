//
//  FilterAssembly.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

class FilterAssembly {
    func createFilterModule() -> FilterModule {
        let vc = FilterViewController()
        let presenter = FilterPresenter()
        let interactor = FilterInteractor(withSearchSettingsService: ServiceAssembly().createSearchSettingsService())
        let router = FilterRouter()
        
        vc.output = presenter
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = vc
        
        return presenter
    }
}
