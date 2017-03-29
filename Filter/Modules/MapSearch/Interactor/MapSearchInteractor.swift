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
}

protocol MapSearchInteractorOutput:class {
    func interactorRequestCurrentLocationDidFinish(withSuccess location: CLLocation)
    func interactorRequestCurrentLocationDidFail(withError error: Error)
}

class MapSearchInteractor:  MapSearchInteractorInput {
    weak var output: MapSearchInteractorOutput!
    
    private let locationService: LocationService
    
    init(withLocationService locationService: LocationService) {
        self.locationService = locationService
    }
    
    //MARK : MapSearchInteractorInput
    
    func requestCurrentLocation() {
        locationService.requestCurrentLocation(successful: { (location) in
            self.output.interactorRequestCurrentLocationDidFinish(withSuccess: location)
        }) { (error) in
            self.output.interactorRequestCurrentLocationDidFail(withError: error)
        }
    }
}
