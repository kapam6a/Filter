//
//  DeamonAssembly.swift
//  Filter
//
//  Created by admin5 on 03.04.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

class DeamonAssembly {
    func createLocationDeamon() -> Deamon{
        let storage = StorageImplementation()
        let requestFactory = RequestFactoryImplementation()
        return LocationDeamon(storage: storage,
                       requestFactory: requestFactory)
    }
}
