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
    func openShortProfileModule(_ callback: (ShortProfileModule) -> Void)
}

class MapSearchRouter: MapSearchRouterInput {
    weak var viewController: UIViewController!
    
    //MARK : NewInterestsRouterInput
    
    func closeModule() {
        let _ = viewController.navigationController?.popViewController(animated: true)
    }
    
    func openShortProfileModule(_ callback: (ShortProfileModule) -> Void) {
        let shortProfileModule = ShortProfileAssembly().createShortProfileModule()
        callback(shortProfileModule)
        viewController.navigationController!.pushViewController(shortProfileModule.viewController, animated: true)
    }
}
