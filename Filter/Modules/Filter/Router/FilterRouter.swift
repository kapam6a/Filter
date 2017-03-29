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
    func openMapSearchModule(_ callback: (MapSearchModule) -> Void)
    func openPhotosModule(_ callback: (PhotosModule) -> Void)
    func openShortProfileModule(_ callback: (ShortProfileModule) -> Void)
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
        viewController.navigationController!.pushViewController(newInterestsModule.viewController, animated: true)
    }
    
    func openMapSearchModule(_ callback: (MapSearchModule) -> Void) {
        let mapSearchModule = MapSearchAssembly().createMapSearchModule()
        callback(mapSearchModule)
        viewController.navigationController!.pushViewController(mapSearchModule.viewController, animated: true)
    }
    
    func openPhotosModule(_ callback: (PhotosModule) -> Void) {
        let photosModule = PhotosAssembly().createPhotosModule()
        callback(photosModule)
        let photosViewController = photosModule.viewController
        photosViewController.modalPresentationStyle = .overCurrentContext
        viewController.present(photosViewController, animated: true)
    }
    
     func openShortProfileModule(_ callback: (ShortProfileModule) -> Void) {
        let shortProfileModule = ShortProfileAssembly().createShortProfileModule()
        callback(shortProfileModule)
        viewController.navigationController!.pushViewController(shortProfileModule.viewController, animated: true)
    }
}
