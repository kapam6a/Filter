//
//  File.swift
//  Filter
//
//  Created by admin5 on 06.04.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

class CoreDataStackCoordinatorAssembly {
    func createCoreDataStackCoordinator() -> CoreDataStackCoordinator {
        return CoreDataStackCoordinatorImplementation()
    }
}
