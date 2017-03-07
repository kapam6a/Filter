//
//  FilterAssembly.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

class FilterAssembly {
    func createFilterModule() -> FilterModuleInput {
        let vc = FilterViewController()
        let presenter = FilterPresenter()
        let interactor = FilterInteractor(withSearchSettingsService: SearchSettingsServiceImpl())
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
