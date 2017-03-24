//
//  FilterRouter.swift
//  Filter
//
//  Created by admin5 on 07.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol PhotosRouterInput {
    func closeModule()
}

class PhotosRouter: PhotosRouterInput {
    weak var viewController: UIViewController!
    
    //MARK : PhotosRouterInput
    
    func closeModule() {
        let _ = viewController.dismiss(animated: true, completion: nil)
    }
}
