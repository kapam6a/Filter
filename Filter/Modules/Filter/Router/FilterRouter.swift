//
//  FilterRouter.swift
//  Filter
//
//  Created by admin5 on 07.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol FilterRouterInput {
    func openAgeSelectionModule(withConfiguration configuration: AgeSelectionModuleConfiguration)
}

class FilterRouter: FilterRouterInput {
    weak var viewController: UIViewController!
    
    //MARK : FilterRouterInput
    
    func openAgeSelectionModule(withConfiguration configuration: AgeSelectionModuleConfiguration) {
        let ageSelectionModule = AgeSelectionAssembly().createAgeSelectionModule(withConfiguration: configuration)
        viewController.present(ageSelectionModule.viewController, animated: true, completion: nil)
    }
}
