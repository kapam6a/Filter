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
    func requestCurrentLocation()
    func requestSuitableUsers()
}

protocol MapSearchInteractorOutput:class {
    func interactorRequestCurrentLocationDidFinish(withSuccess locationEntity: LocationEntity)
    func interactorRequestCurrentLocationDidFail(withError error: Error)
}

class MapSearchInteractor:  MapSearchInteractorInput {
    weak var output: MapSearchInteractorOutput!
    
    private let locationService: LocationService
    
    private var myLocation: CLLocation?
    
    init(withLocationService locationService: LocationService) {
        self.locationService = locationService
    }
    
    //MARK : MapSearchInteractorInput
    
    func requestCurrentLocation() {
        locationService.requestCurrentLocation(successful: { locationEntity in
            self.output.interactorRequestCurrentLocationDidFinish(withSuccess: locationEntity)
            self.myLocation = locationEntity.location
        }) { error in
            self.output.interactorRequestCurrentLocationDidFail(withError: error)
        }
    }
    
    func requestSuitableUsers() {
        
    }
}
