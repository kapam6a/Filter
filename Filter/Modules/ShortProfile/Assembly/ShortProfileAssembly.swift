//
//  FilterAssembly.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

class ShortProfileAssembly {
    func createShortProfileModule() -> ShortProfileModule {
        let vc = ShortProfileViewController()
        let presenter = ShortProfilePresenter()
        let interactor = ShortProfileInteractor(withProfileService: ServiceAssembly().createUserProfileService())
        let router = ShortProfileRouter()
        
        vc.output = presenter
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = vc
        
        return presenter
    }
}
