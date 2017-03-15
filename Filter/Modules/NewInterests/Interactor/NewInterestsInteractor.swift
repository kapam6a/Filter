//
//  File.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

protocol NewInterestsInteractorInput {
    func getInterests()
    func getInterests(withSearchText searchText: String)
}

protocol NewInterestsInteractorOutput:class {
    func interactorDidGetInterests(_ interests: [InterestsEntity])
}

class NewInterestsInteractor: NewInterestsInteractorInput {
    weak var output: NewInterestsInteractorOutput!
    
    private let interestsService: InterestsService
    
    init(withInterestsService interestsService: InterestsService) {
        self.interestsService = interestsService
    }
    
    //MARK : NewInterestsInteractorInput
    
    func getInterests() {
        let interests = interestsService.requestInterests()
        output.interactorDidGetInterests(interests)
    }
    
    func getInterests(withSearchText searchText: String) {
        let interests = interestsService.requestInterests(withSearchText: searchText)
        output.interactorDidGetInterests(interests)
    }
}
