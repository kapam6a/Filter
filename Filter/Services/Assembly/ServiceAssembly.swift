//
//  File.swift
//  Filter
//
//  Created by admin5 on 29.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

class ServiceAssembly {
    func createUserService() -> UserService {
        let converter = UserConverterImplementation()
        let networkClient = NetworkClientAssembly().createNetworkClient()
        let requestFactory = RequestFactoryImplementation()
        let storage = StorageAssembly().createStorage()
        return UserServiceImplementation(networkClient: networkClient,
                                         converter: converter,
                                         requestFactory: requestFactory,
                                         storage: storage)
    }
    
    func createLocationService() -> LocationService {
        let locationService = LocationServiceImplementation()
        return locationService
    }
    
    func createPhotosService() -> PhotosService {
        let photosService = PhotosServiceImplementation()
        return photosService
    }
    
    func createSearchSettingsService() -> SearchSettingsService {
        let searchSettingsService = SearchSettingsServiceImplementation()
        return searchSettingsService
    }
    
    func createInterestsService() -> InterestsService {
        let interestsService = InterestsServiceImplementation()
        return interestsService
    }
}
