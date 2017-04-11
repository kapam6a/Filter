//
//  StorageMapper.swift
//  Filter
//
//  Created by admin5 on 10.04.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

protocol StorageMapper {
    func mapUserEntity(with user: User) -> UserEntity
    func mapUser(user: User, with userEntity: UserEntity) -> User
}

class StorageMapperImplementation: StorageMapper {
    func mapUserEntity(with user: User) -> UserEntity {
        return UserEntity(photoURLPath: user.photoURLPath!,
                          aboutMe: user.aboutMe!,
                          age: Int(user.age),
                          city: user.city!,
                          email: user.email!,
                          firstName: user.firstName!,
                          id: Int(user.id),
                          nick: user.nick!,
                          phoneNumber: user.phoneNumber!,
                          secondName: user.secondName!,
                          sex: user.sex,
                          status: user.status!,
                          work: user.work!,
                          latitude: user.latitude,
                          longitude: user.longitude)
    }
    
    func mapUser(user: User, with userEntity: UserEntity) -> User {
        user.photoURLPath = userEntity.photoURLPath
        user.aboutMe = userEntity.aboutMe
        user.age = Int16(userEntity.age)
        user.city = userEntity.city
        user.email = userEntity.email
        user.firstName = userEntity.firstName
        user.id = Int64(userEntity.id)
        user.nick = userEntity.nick
        user.phoneNumber = userEntity.phoneNumber
        user.secondName = userEntity.secondName
        user.sex = userEntity.sex
        user.status = userEntity.status
        user.work = userEntity.work
        user.latitude = userEntity.latitude
        user.longitude = userEntity.longitude

        return user
    }
}
