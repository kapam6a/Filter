//
//  NetworkClientAssembly.swift
//  Filter
//
//  Created by admin5 on 10.04.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

class NetworkClientAssembly {
    func createNetworkClient() -> NetworkClient {
        let errorHandler = ErrorHandlerImplementation()
        return NetworkClientImplementation(errorHandler: errorHandler)
    }
}
