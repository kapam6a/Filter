//
//  Mapper.swift
//  Filter
//
//  Created by admin5 on 29.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

protocol UserMapper {
    func mapUser(_ dictionary: [String: Any]) -> UserEntity
    func mapUsers(_ dictionary: [String: Any]) -> [UserEntity]
}

class UserMapperImplementation: UserMapper {
    func mapUsers(_ dictionary: [String: Any]) -> [UserEntity] {
        var userEntities: [UserEntity] = []
        
        return userEntities
    }
    
    func mapUser(_ dictionary: [String: Any]) -> UserEntity {
        let user = dictionary["user"] as! [String: Any]
        let userInfo = user["user"] as! [String: Any]
        let aboutMe = userInfo["aboutMe"] as? String ?? ""
        let age = userInfo["age"] as! Int
        let city = userInfo["city"] as! String
        let email = userInfo["email"] as! String
        let firstName = userInfo["firstName"] as! String
        let id = userInfo["id"] as! Int
        let nick = userInfo["nick"] as? String ?? ""
        let phoneNumber = userInfo["phoneNumber"] as? String ?? ""
        let secondName = userInfo["secondName"] as! String
        let sex = userInfo["sex"] as! Int
        let status = userInfo["status"] as? String ?? ""
        let work = userInfo["work"] as? String ?? ""
        let latitude = userInfo["latitude"] as? Double ?? 0
        let longitude = userInfo["longitude"] as? Double ?? 0
        
        return UserEntity(photoUrl: URL(fileURLWithPath: "/Users/admin/Desktop/Filter/Filter/face.jpg"),
                          aboutMe: aboutMe,
                          age: age,
                          city: city,
                          email: email,
                          firstName: firstName,
                          id: id,
                          nick: nick,
                          phoneNumber: phoneNumber,
                          secondName: secondName,
                          sex: sex,
                          status: status,
                          work: work,
                          latitude: latitude,
                          longitude: longitude)
    }
}
