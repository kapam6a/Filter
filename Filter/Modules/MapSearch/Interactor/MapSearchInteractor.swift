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
    func requestMyProfile()
    func requestClosestUsers()
}

protocol MapSearchInteractorOutput:class {
    func interactorRequestMyProfileDidFinish(withSuccess myProfile: UserEntity)
    func interactorRequestClosestUsersDidFinish(withSuccess closeUsers: [UserEntity])
    func interactorRequestDidFail(withError error: Error)

}

class MapSearchInteractor:  MapSearchInteractorInput {
    weak var output: MapSearchInteractorOutput!
    
    private let locationService: LocationService
    private let userService: UserService
    
    private var currentLocationEntity: LocationEntity!
    
    init(locationService: LocationService, userService: UserService) {
        self.locationService = locationService
        self.userService = userService
    }
    
    //MARK : MapSearchInteractorInput
    
    func requestMyProfile() {
        locationService.requestCurrentLocation(successful: { locationEntity in
            self.userService.requestMyProfile(successful: { myProfile in
                self.output.interactorRequestMyProfileDidFinish(withSuccess: UserEntity(photoURLPath: myProfile.photoURLPath,
                                                                                        aboutMe: myProfile.aboutMe,
                                                                                        age: myProfile.age,
                                                                                        city: myProfile.city,
                                                                                        email: myProfile.email,
                                                                                        firstName: myProfile.firstName,
                                                                                        id: myProfile.id,
                                                                                        nick: myProfile.nick,
                                                                                        phoneNumber: myProfile.phoneNumber,
                                                                                        secondName: myProfile.secondName,
                                                                                        sex: myProfile.sex,
                                                                                        status: myProfile.status,
                                                                                        work: myProfile.work,
                                                                                        latitude: myProfile.latitude,
                                                                                        longitude: myProfile.longitude))
            }, failed: { error in
                self.output.interactorRequestDidFail(withError: error)
            })
        }) { error in
            self.output.interactorRequestDidFail(withError: error)
        }
    }
    
    func requestClosestUsers() {
        userService.requestClosestUsers(successful: { userEntities in
            self.output.interactorRequestClosestUsersDidFinish(withSuccess: userEntities)
        },
                                        failed: { error in
                                            self.output.interactorRequestDidFail(withError: error)
        })
    }
}
