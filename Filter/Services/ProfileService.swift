//
//  File.swift
//  Filter
//
//  Created by admin5 on 23.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

struct ProfileEntity {
    let name: String
}

protocol ProfileService {
    func requestProfile(successful: @escaping (ProfileEntity) -> Void, failed: @escaping (Error) -> Void)
}

class ProfileServiceImpl: ProfileService {
    func requestProfile(successful: @escaping (ProfileEntity) -> Void, failed: @escaping (Error) -> Void) {
        let profileEntity = ProfileEntity(name: "sgargaerbg")
        
        successful(profileEntity)
    }
}
