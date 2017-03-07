//
//  FilterRouter.swift
//  Filter
//
//  Created by admin5 on 07.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol AgeSelectionRouterInput {
    func closeModule()
}

class AgeSelectionRouter: AgeSelectionRouterInput {
    weak var viewController: UIViewController!
    
    //MARK : FilterRouterInput
    
    func closeModule() {
        viewController.dismiss(animated: true, completion:nil)
    }
}
