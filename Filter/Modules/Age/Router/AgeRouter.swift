//
//  FilterRouter.swift
//  Filter
//
//  Created by admin5 on 07.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol AgeRouterInput {
    func closeModule()
}

class AgeRouter: AgeRouterInput {
    weak var viewController: UIViewController!
    
    //MARK : AgeRouterInput
    
    func closeModule() {
        let _ = viewController.navigationController?.popViewController(animated: true)
    }
}
