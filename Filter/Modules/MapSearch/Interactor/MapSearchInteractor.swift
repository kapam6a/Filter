//
//  File.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation
import CoreLocation

protocol MapSearchInteractorInput {
    func requestCurrentUser()
    func requestCloseUsers()
}

protocol MapSearchInteractorOutput:class {
    func interactorRequestCurrentUserDidFinish(withSuccess currentUser: UserEntity)
    func interactorRequestCloseUsersDidFinish(withSuccess closeUsers: [UserEntity])
    func interactorRequestDidFail(withError error: Error)

}

class MapSearchInteractor:  MapSearchInteractorInput {
    weak var output: MapSearchInteractorOutput!
    
    private let locationService: LocationService
    private let closeUsersService: CloseUsersService
    private let userProfileService: UserProfileService
    
    private var currentLocationEntity: LocationEntity!
    
    init(locationService: LocationService, closeUsersService: CloseUsersService, userProfileService: UserProfileService) {
        self.locationService = locationService
        self.closeUsersService = closeUsersService
        self.userProfileService = userProfileService
    }
    
    //MARK : MapSearchInteractorInput
    
    func requestCurrentUser() {
        locationService.requestCurrentLocation(successful: { locationEntity in
            self.currentLocationEntity = locationEntity
            
            self.userProfileService.requestCurrentUser(successful: { currentUser in
                                                        self.output.interactorRequestCurrentUserDidFinish(withSuccess: UserEntity(photoUrl: currentUser.photoUrl,
                                                                                                                                  aboutMe: currentUser.aboutMe,
                                                                                                                                  age: currentUser.age,
                                                                                                                                  city: currentUser.city,
                                                                                                                                  email: currentUser.email,
                                                                                                                                  firstName: currentUser.firstName,
                                                                                                                                  id: currentUser.id,
                                                                                                                                  nick: currentUser.nick,
                                                                                                                                  phoneNumber: currentUser.phoneNumber,
                                                                                                                                  secondName: currentUser.secondName,
                                                                                                                                  sex: currentUser.sex,
                                                                                                                                  status: currentUser.status,
                                                                                                                                  work: currentUser.work,
                                                                                                                                  latitude: locationEntity.latitude,
                                                                                                                                  longitude: locationEntity.longitude))
                                                    }, failed: { error in
                                                        self.output.interactorRequestDidFail(withError: error)
                                                    })
        }) { error in
            self.output.interactorRequestDidFail(withError: error)
        }
    }
    
    func requestCloseUsers() {
        closeUsersService.requestCloseUsers(latitude: currentLocationEntity.latitude,
                                            longitude: currentLocationEntity.longitude,
                                            successful: { userEntities in
                                                self.output.interactorRequestCloseUsersDidFinish(withSuccess: userEntities)
                                            },
                                            failed: { error in
                                                 self.output.interactorRequestDidFail(withError: error)
                                            })
    }
}
