//
//  AppDelegate.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreData

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootModule: FilterModule!
    
    var locationDeamon: Deamon!
    var managedObjectContext: NSManagedObjectContext!
        
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        rootModule = FilterAssembly().createFilterModule()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: rootModule.viewController)
        window?.makeKeyAndVisible()
        
        GMSServices.provideAPIKey("AIzaSyBskBANCZoBNNDLMhkVbmU1wjLCnEdlmTc")
        
        let coreDataStackCoordinator = CoreDataStackCoordinatorAssembly().createCoreDataStackCoordinator()
        managedObjectContext = coreDataStackCoordinator.setupCoreDataStack()
        
        locationDeamon = DeamonAssembly().createLocationDeamon()
        locationDeamon.start()
        
        return true
    }
}

