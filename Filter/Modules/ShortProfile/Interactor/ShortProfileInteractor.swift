//
//  File.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

protocol ShortProfileInteractorInput {

}

protocol ShortProfileInteractorOutput:class {
    
}

class ShortProfileInteractor: ShortProfileInteractorInput {
    weak var output: ShortProfileInteractorOutput!
    
    private let profileService: ProfileService
    
    init(withProfileService profileService: ProfileService) {
        self.profileService = profileService
    }
    
    //MARK : ShortProfileInteractorInput
}
