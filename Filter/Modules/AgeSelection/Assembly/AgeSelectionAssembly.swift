//
//  FilterAssembly.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

class AgeSelectionAssembly {
    func createAgeSelectionModule() -> AgeSelectionModule {
        let vc = AgeSelectionViewController()
        let presenter = AgeSelectionPresenter()
        let interactor = AgeSelectionInteractor()
        let router = AgeSelectionRouter()
        
        vc.output = presenter
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = vc
        
        return presenter
    }
}
