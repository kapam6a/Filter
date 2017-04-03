//
//  FilterAssembly.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

class MapSearchAssembly {
    func createMapSearchModule() -> MapSearchModule {
        let vc = MapSearchViewController()
        let presenter = MapSearchPresenter()
        let interactor = MapSearchInteractor(locationService: ServiceAssembly.createLocationService(),
                                           closeUsersService: ServiceAssembly.createCloseUsersService(),
                                           userProfileService: ServiceAssembly.createUserProfileService())
        let router = MapSearchRouter()
        
        vc.output = presenter
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = vc
        
        return presenter
    }
}
