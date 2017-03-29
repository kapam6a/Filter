//
//  NetworkClientAssembly.swift
//  Filter
//
//  Created by admin5 on 29.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

class NetworkClientAssembly {
    func createUserProfileNetworkClient() -> NetworkClient {
        let request = RequestFactory.userProfileRequest()
        return NetworkClientImplementation(with: request)
    }
}
