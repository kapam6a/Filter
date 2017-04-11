//
//  File.swift
//  Filter
//
//  Created by admin5 on 10.04.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class StorageAssembly {
    func createStorage() -> Storage {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = appDelegate.managedObjectContext
        let storageMapper = StorageMapperImplementation()
        return StorageImplementation(managedObjectContext: managedObjectContext!, mapper: storageMapper)
    }
}
