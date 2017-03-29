//
//  File.swift
//  Filter
//
//  Created by admin5 on 29.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

class ServiceAssembly {
    func createUserProfileService() -> UserProfileService {
        let mapper = UserProfileMapperImplementation()
        let networkClient = NetworkClientAssembly().createUserProfileNetworkClient()
        return UserProfileServiceImplementation(with: networkClient, mapper)
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
