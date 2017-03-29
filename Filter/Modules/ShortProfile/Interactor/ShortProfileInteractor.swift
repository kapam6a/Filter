//
//  File.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

protocol ShortProfileInteractorInput {
    func requestUserProfile(with id: Int)
}

protocol ShortProfileInteractorOutput:class {
    func interactorRequestUserProfileDidFinish(withSuccess profileEntity: UserProfileEntity)
    func interactorRequestUserProfileDidFail(withError error: Error)
}

class ShortProfileInteractor: ShortProfileInteractorInput {
    weak var output: ShortProfileInteractorOutput!
    
    private let profileService: UserProfileService
    
    init(withProfileService profileService: UserProfileService) {
        self.profileService = profileService
    }
    
    //MARK : ShortProfileInteractorInput
    
    func requestUserProfile(with id: Int) {
        profileService.requestUserProfile(successful: { profileEntity in
            self.output.interactorRequestUserProfileDidFinish(withSuccess: profileEntity)
        }) { error in
            self.output.interactorRequestUserProfileDidFail(withError: error)
        }
    }
}
