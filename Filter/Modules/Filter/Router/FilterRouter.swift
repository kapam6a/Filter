//
//  FilterRouter.swift
//  Filter
//
//  Created by admin5 on 07.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol FilterRouterInput {
    func openAgeSelectionModule(_ callback: (AgeSelectionModule) -> Void)
}

class FilterRouter: FilterRouterInput {
    weak var viewController: UIViewController!
    
    //MARK : FilterRouterInput
    
    func openAgeSelectionModule(_ callback: (AgeSelectionModule) -> Void) {
        let ageSelectionModule = AgeSelectionAssembly().createAgeSelectionModule()
        callback(ageSelectionModule)
        viewController.present(ageSelectionModule.viewController, animated: true, completion: nil)
    }
}
