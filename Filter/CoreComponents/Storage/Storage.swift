//
//  File.swift
//  Filter
//
//  Created by admin5 on 03.04.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation
import CoreData
import Security
import MapKit

protocol Storage {
    func getToken() -> String?
    func saveToken(_ token: String)
    func getMyProfile() -> UserEntity?
    func saveMyProfile(_ myProfile: UserEntity)
    func getClosestUsers() -> [UserEntity]?
    func saveClosestUsers(_ users: [UserEntity])
    func getUser(with id: Int) -> UserEntity?
    func saveMyCoordiante(_ latitude: Double, _ longitude: Double)
}

class StorageImplementation: Storage {
    private let managedObjectContext: NSManagedObjectContext
    private let mapper: StorageMapper
    
    init(managedObjectContext: NSManagedObjectContext, mapper: StorageMapper) {
        self.managedObjectContext = managedObjectContext
        self.mapper = mapper
    }
    
    func getToken() -> String? {
        return "yJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjE1MCwiaXNzIjoiaHR0cDpcL1wvNDYuMTAxLjE2LjM1XC9hcGlcL2F1dGhcL3JlZ2lzdGVyIiwiaWF0IjoxNDkxNTU5MDI3LCJleHAiOjE0OTE1NjI2MjcsIm5iZiI6MTQ5MTU1OTAyNywianRpIjoiMGI5Mzc3NjIwYjQwMjUyN2MzZjBkYjYwZmZhMmE3MGMifQ.GScDmhqGNq8kl1rw8TEdJMOL_MQVVynzT01dPCgUYV8"
    }
    
    func saveToken(_ token: String) {
        let keychainQuery: NSMutableDictionary = NSMutableDictionary(objects: [token], forKeys: ["token" as NSCopying])
        SecItemDelete(keychainQuery)
        SecItemAdd(keychainQuery, nil)
    }
    
    func getMyProfile() -> UserEntity? {
        let fetchRequest = User.myProfileFetchRequest()
        let results = try! managedObjectContext.fetch(fetchRequest)
        guard let myProfile = results.first else {
            return nil
        }
        
        return mapper.mapUserEntity(with: myProfile)
    }
    
    func saveMyProfile(_ myProfile: UserEntity) {
        let fetchRequest = User.myProfileFetchRequest()
        let results = try! managedObjectContext.fetch(fetchRequest)
        var myProfileManagedObject: User
        if let existingMyProfileManagedObject = results.first {
            myProfileManagedObject = existingMyProfileManagedObject
        } else {
            myProfileManagedObject = NSEntityDescription.insertNewObject(forEntityName: User.entityName,
                                                                         into: managedObjectContext) as! User
        }
        
        let mappedMyProfile = mapper.mapUser(user: myProfileManagedObject, with: myProfile)
        mappedMyProfile.isMe = true
        
        try! managedObjectContext.save()
    }
    
    func getClosestUsers() -> [UserEntity]? {
        let fetchRequest = User.closestUsersFetchRequest()
        let results = try! managedObjectContext.fetch(fetchRequest)
        
        var userEntities: [UserEntity] = []
        
        results.forEach { user in
            let userEntity = mapper.mapUserEntity(with: user)
            userEntities.append(userEntity)
        }
        
        return userEntities
    }
    
    func saveClosestUsers(_ users: [UserEntity]) {
        let fetchRequest = User.closestUsersFetchRequest()
        let results = try! managedObjectContext.fetch(fetchRequest)
        results.forEach { user in
            managedObjectContext.delete(user)
        }
        
        users.forEach { userEntity in
            let user = NSEntityDescription.insertNewObject(forEntityName: User.entityName,
                                                           into: managedObjectContext) as! User
            
            let mappedUser = mapper.mapUser(user: user, with: userEntity)
            mappedUser.isMe = false
        }
        
        try! managedObjectContext.save()
    }
    
    func getUser(with id: Int) -> UserEntity? {
        let fetchRequest = User.userFetchRequest(id: id)
        let results = try! managedObjectContext.fetch(fetchRequest)
        guard let user = results.first else {
            return nil
        }
        
        return mapper.mapUserEntity(with: user)
    }
    
    func saveMyCoordiante(_ latitude: Double, _ longitude: Double) {
        let fetchRequest = User.myProfileFetchRequest()
        let results = try! managedObjectContext.fetch(fetchRequest)
        let myProfile = results.first!
        
        myProfile.latitude = latitude
        myProfile.longitude = longitude
        
        try! managedObjectContext.save()
    }

}
