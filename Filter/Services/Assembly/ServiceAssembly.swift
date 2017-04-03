//
//  File.swift
//  Filter
//
//  Created by admin5 on 29.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

class ServiceAssembly {
    static func createUserProfileService() -> UserProfileService {
        let mapper = UserMapperImplementation()
        let networkClient = NetworkClientImplementation()
        let requestFactory = RequestFactoryImplementation()
        let storage = StorageImplementation()
        return UserProfileServiceImplementation(networkClient: networkClient,
                                                       mapper: mapper,
                                               requestFactory: requestFactory,
                                                      storage: storage)
    }
    
    static func createCloseUsersService() -> CloseUsersService {
        let mapper = UserMapperImplementation()
        let networkClient = NetworkClientImplementation()
        let requestFactory = RequestFactoryImplementation()
        let storage = StorageImplementation()
        return CloseUsersServiceImplementation(networkClient: networkClient,
                                                      mapper: mapper,
                                              requestFactory: requestFactory,
                                                     storage: storage)
    }
    
    static func createLocationService() -> LocationService {
        let locationService = LocationServiceImplementation()
        return locationService
    }
    
    static func createPhotosService() -> PhotosService {
        let photosService = PhotosServiceImplementation()
        return photosService
    }
    
    static func createSearchSettingsService() -> SearchSettingsService {
        let searchSettingsService = SearchSettingsServiceImplementation()
        return searchSettingsService
    }
    
    static func createInterestsService() -> InterestsService {
        let interestsService = InterestsServiceImplementation()
        return interestsService
    }
}
