//
//  FilterRouter.swift
//  Filter
//
//  Created by admin5 on 07.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol FilterRouterInput {
    func openAgeModule(_ callback: (AgeModule) -> Void)
    func openInterestsModule(_ callback: (NewInterestsModule) -> Void)
}

class FilterRouter: FilterRouterInput {
    weak var viewController: UIViewController!
    
    //MARK : FilterRouterInput
    
    func openAgeModule(_ callback: (AgeModule) -> Void) {
        let ageModule = AgeAssembly().createAgeModule()
        callback(ageModule)
        viewController.navigationController!.pushViewController(ageModule.viewController, animated: true)
    }
    
    func openInterestsModule(_ callback: (NewInterestsModule) -> Void) {
        let newInterestsModule = NewInterestsAssembly().createNewInterestsModule()
        callback(newInterestsModule)
        let vc = newInterestsModule.viewController
        vc.modalPresentationStyle = .overCurrentContext
        viewController.navigationController!.pushViewController(newInterestsModule.viewController, animated: true)
    }
}
