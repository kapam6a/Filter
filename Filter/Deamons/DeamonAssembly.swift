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
        let storage = StorageAssembly().createStorage()
        let requestFactory = RequestFactoryImplementation()
        let networkClient = NetworkClientAssembly().createNetworkClient()
        let converter = UserConverterImplementation()
        return LocationDeamon(storage: storage,
                              requestFactory: requestFactory,
                              networkClient: networkClient,
                              converter: converter)
    }
}
