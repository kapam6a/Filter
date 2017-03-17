//
//  FilterRouter.swift
//  Filter
//
//  Created by admin5 on 07.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol MapSearchRouterInput {
    func closeModule()
}

class MapSearchRouter: MapSearchRouterInput {
    weak var viewController: UIViewController!
    
    //MARK : NewInterestsRouterInput
    
    func closeModule() {
        let _ = viewController.navigationController?.popViewController(animated: true)
    }
}
