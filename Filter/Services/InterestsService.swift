//
//  File.swift
//  Filter
//
//  Created by admin5 on 13.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

struct InterestsEntity {
    let name: String
}

protocol InterestsService {
    func requestInterests() -> [InterestsEntity]
    func requestInterests(withSearchText searchText: String) -> [InterestsEntity]
}

class InterestsServiceImpl: InterestsService{
    private var interests: [InterestsEntity] = []
    
    init() {
        let entity1 = InterestsEntity(name: "sleep")
        interests.append(entity1)
        
        let entity2 = InterestsEntity(name: "eat")
        interests.append(entity2)
        
        let entity3 = InterestsEntity(name: "music")
        interests.append(entity3)
        
        let entity4 = InterestsEntity(name: "work")
        interests.append(entity4)
        
        let entity5 = InterestsEntity(name: "ice-cream")
        interests.append(entity5)
        
        let entity6 = InterestsEntity(name: "drawing")
        interests.append(entity6)
        
        let entity7 = InterestsEntity(name: "disco")
        interests.append(entity7)
        
        let entity8 = InterestsEntity(name: "night_life")
        interests.append(entity8)
        
        let entity9 = InterestsEntity(name: "nwEVebvweV")
        interests.append(entity9)
        
        let entity10 = InterestsEntity(name: "=+++++++++++++")
        interests.append(entity10)
        
        let entity11 = InterestsEntity(name: "DRAGONS")
        interests.append(entity11)
        
        let entity12 = InterestsEntity(name: "hangOut")
        interests.append(entity12)
        
        let entity13 = InterestsEntity(name: "coding")
        interests.append(entity13)
        
        let entity14 = InterestsEntity(name: "pokemon")
        interests.append(entity14)
        
        let entity15 = InterestsEntity(name: "stupidApp")
        interests.append(entity15)
    }
    
    func requestInterests() -> [InterestsEntity] {
        return interests
    }
    
    func requestInterests(withSearchText searchText: String) -> [InterestsEntity] {
        var searchingInterests: [InterestsEntity] = []
        let lowCaseSearchText = searchText.lowercased()
        for interest in interests {
            if interest.name.lowercased().contains(lowCaseSearchText) {
                searchingInterests.append(interest)
            }
        }
        return searchingInterests
    }
}
