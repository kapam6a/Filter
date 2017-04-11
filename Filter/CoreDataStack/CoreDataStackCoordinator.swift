//
//  File.swift
//  Filter
//
//  Created by admin5 on 06.04.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation
import CoreData

protocol CoreDataStackCoordinator {
    func setupCoreDataStack() -> NSManagedObjectContext
}

class CoreDataStackCoordinatorImplementation: CoreDataStackCoordinator {
    func setupCoreDataStack() -> NSManagedObjectContext {
        let modelURL = Bundle.main.url(forResource: "Model", withExtension: "momd")!
        let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL)!
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
        
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
        let storeURL = documentsURL.appendingPathComponent("Model" + ".sqlite")
        try! persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType,
                                                           configurationName: nil,
                                                           at: storeURL,
                                                           options: nil)
        return managedObjectContext
    }
}
