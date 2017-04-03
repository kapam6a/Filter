//
//  File.swift
//  Filter
//
//  Created by admin5 on 03.04.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

protocol CloseUsersService {
    func requestCloseUsers(latitude: Double, longitude: Double, successful: @escaping ([UserEntity]) -> Void, failed: @escaping (Error) -> Void)
}

class CloseUsersServiceImplementation: NSObject, CloseUsersService {
    private let networkClient: NetworkClient
    private let mapper: UserMapper
    private let requestFactory: RequestFactory
    private let storage: Storage
    
    init(networkClient: NetworkClient, mapper: UserMapper, requestFactory: RequestFactory, storage: Storage) {
        self.networkClient = networkClient
        self.mapper = mapper
        self.requestFactory = requestFactory
        self.storage = storage
    }
    
    func requestCloseUsers(latitude: Double, longitude: Double, successful: @escaping ([UserEntity]) -> Void, failed: @escaping (Error) -> Void) {
        let token = storage.getToken()
        let request = requestFactory.closeUsersRequest(latitude: latitude,
                                                      longitude: longitude,
                                                          token: token)
        networkClient.sendRequest(request: request,
                               successful: { data in
                                    let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                                    successful(self.mapper.mapUsers(json))
                                }) { error in
                                    failed(error)
                                }
    }
}
