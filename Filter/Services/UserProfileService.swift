//
//  File.swift
//  Filter
//
//  Created by admin5 on 23.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

struct UserEntity {
    let photoUrl: URL
    let aboutMe: String
    let age: Int
    let city: String
    let email: String
    let firstName: String
    let id: Int
    let nick: String
    let phoneNumber: String
    let secondName:String
    let sex: Int
    let status: String
    let work: String
    let latitude: Double
    let longitude: Double
}

protocol UserProfileService {
    func requestUser(userId: Int, successful: @escaping (UserEntity) -> Void, failed: @escaping (Error) -> Void)
    func requestCurrentUser(successful: @escaping (UserEntity) -> Void, failed: @escaping (Error) -> Void)
}

class UserProfileServiceImplementation: NSObject, UserProfileService {
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
    
    //Mark : UserProfileService
    
    func requestUser(userId: Int, successful: @escaping (UserEntity) -> Void, failed: @escaping (Error) -> Void) {
        let token = storage.getToken()
        let request = requestFactory.userRequest(userId: userId,
                                                 token: token)
        
        networkClient.sendRequest(request: request,
                               successful: { data in
                                    let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                                    successful(self.mapper.mapUser(json))
        }) { error in
            failed(error)
        }
    }
    
    func requestCurrentUser(successful: @escaping (UserEntity) -> Void, failed: @escaping (Error) -> Void) {
        let currentProfile = storage.getProfileInformation()
        successful(currentProfile)
    }
}
