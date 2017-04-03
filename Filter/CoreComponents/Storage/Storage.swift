//
//  File.swift
//  Filter
//
//  Created by admin5 on 03.04.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

protocol Storage {
    func getToken() -> String
    func saveToken(_ token: String)
    func getProfileInformation() -> UserEntity
    func saveProfileInformation(_ userProfileEntity: UserEntity)
}

class StorageImplementation: Storage {
    private let userDefaults: UserDefaults
    
    init() {
        userDefaults = UserDefaults.standard
    }
    
    func getToken() -> String {
        return "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEzOSwiaXNzIjoiaHR0cDpcL1wvNDYuMTAxLjE2LjM1XC9hcGlcL2F1dGhcL3JlZ2lzdGVyIiwiaWF0IjoxNDkxMjAzNTUzLCJleHAiOjE0OTEyMDcxNTMsIm5iZiI6MTQ5MTIwMzU1MywianRpIjoiZTliZDJhY2U3NDdjNmQwZDRjZTk1NjY1YmFiNTY3NmUifQ.oG0bcatKVeD3T3RuYnBTybf9r65SCn86W268XaJai8I"
       // return userDefaults.object(forKey: "token") as! String
    }
    
    func saveToken(_ token: String) {
        userDefaults.set(token, forKey: "token")
    }
    
    func getProfileInformation() -> UserEntity {
        return UserEntity(photoUrl: URL(string:"/Users/admin/Desktop/Filter/Filter/face.jpg")!,
                          aboutMe: "",
                          age: 0,
                          city: "",
                          email: "",
                          firstName: "",
                          id: 0,
                          nick: "",
                          phoneNumber: "",
                          secondName: "",
                          sex: 0,
                          status: "",
                          work: "",
                          latitude: 0,
                          longitude: 0)
    }
    
    func saveProfileInformation(_ userProfileEntity: UserEntity) {
        
    }
}
