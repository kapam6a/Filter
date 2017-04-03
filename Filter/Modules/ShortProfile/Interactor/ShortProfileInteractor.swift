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
    func interactorRequestUserDidFinish(withSuccess user: UserEntity)
    func interactorRequestDidFail(withError error: Error)
}

class ShortProfileInteractor: ShortProfileInteractorInput {
    weak var output: ShortProfileInteractorOutput!
    
    private let profileService: UserProfileService
    
    init(withProfileService profileService: UserProfileService) {
        self.profileService = profileService
    }
    
    //MARK : ShortProfileInteractorInput
    
    func requestUserProfile(with userId: Int) {
        profileService.requestUser(userId: userId,
                                   successful: { user in
                                    self.output.interactorRequestUserDidFinish(withSuccess: user)
        }) { error in
            self.output.interactorRequestDidFail(withError: error)
        }
    }
}
