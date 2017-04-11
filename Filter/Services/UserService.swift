//
//  File.swift
//  Filter
//
//  Created by admin5 on 23.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

struct UserEntity {
    let photoURLPath: String
    let aboutMe: String
    let age: Int
    let city: String
    let email: String
    let firstName: String
    let id: Int
    let nick: String
    let phoneNumber: String
    let secondName:String
    let sex: Bool
    let status: String
    let work: String
    let latitude: Double
    let longitude: Double
}

protocol UserService {
    func requestUser(userId: Int, successful: @escaping (UserEntity) -> Void, failed: @escaping (Error) -> Void)
    func requestMyProfile(successful: @escaping (UserEntity) -> Void, failed: @escaping (Error) -> Void)
    func requestClosestUsers(successful: @escaping ([UserEntity]) -> Void, failed: @escaping (Error) -> Void)
}

class UserServiceImplementation: NSObject, UserService {
    private let networkClient: NetworkClient
    private let converter: UserConverter
    private let requestFactory: RequestFactory
    private let storage: Storage
    
    init(networkClient: NetworkClient, converter: UserConverter, requestFactory: RequestFactory, storage: Storage) {
        self.networkClient = networkClient
        self.converter = converter
        self.requestFactory = requestFactory
        self.storage = storage
    }
    
    //Mark : UserProfileService
    
    func requestUser(userId: Int, successful: @escaping (UserEntity) -> Void, failed: @escaping (Error) -> Void) {
        guard let myProfile = storage.getUser(with: userId) else { return }
        successful(myProfile)
    }
    
    func requestMyProfile(successful: @escaping (UserEntity) -> Void, failed: @escaping (Error) -> Void) {
        guard let myProfile = storage.getMyProfile() else { return }
        successful(myProfile)
    }
    
    func requestClosestUsers(successful: @escaping ([UserEntity]) -> Void, failed: @escaping (Error) -> Void) {
        guard let closestUsers = storage.getClosestUsers() else { return }
        successful(closestUsers)
    }
}
