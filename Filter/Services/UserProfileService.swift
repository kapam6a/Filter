//
//  File.swift
//  Filter
//
//  Created by admin5 on 23.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

protocol UserProfileService {
    func requestUserProfile(successful: @escaping (UserProfileEntity) -> Void, failed: @escaping (Error) -> Void)
}

class UserProfileServiceImplementation: NSObject, UserProfileService {
    private let networkClient: NetworkClient
    private let mapper: UserProfileMapper
    
    init(with networkClient: NetworkClient, _ mapper: UserProfileMapper) {
        self.networkClient = networkClient
        self.mapper = mapper
    }
    
    func requestUserProfile(successful: @escaping (UserProfileEntity) -> Void, failed: @escaping (Error) -> Void) {
        networkClient.sendRequest(successful: { data in
                                    let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                                    successful(self.mapper.mapUserProfile(json))
                                 }) { error in
                                    failed(error)
                                 }
    }
}
