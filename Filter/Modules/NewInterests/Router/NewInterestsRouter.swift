//
//  FilterRouter.swift
//  Filter
//
//  Created by admin5 on 07.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol NewInterestsRouterInput {
    func closeModule()
}

class NewInterestsRouter: NewInterestsRouterInput {
    weak var viewController: UIViewController!
    
    //MARK : NewInterestsRouterInput
    
    func closeModule() {
        viewController.navigationController?.popViewController(animated: true)
    }
}
