//
//  MapService.swift
//  Filter
//
//  Created by admin5 on 17.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationService {
    func requestCurrentLocation(successful: @escaping (CLLocation) -> Void, failed: @escaping (Error) -> Void)
}

class LocationServiceImplementation: NSObject, LocationService, CLLocationManagerDelegate {
    private let locationManager: CLLocationManager
    
    private var successful: ((CLLocation) -> Void)!
    private var failed: ((Error) -> Void)!
    
    override init() {
        locationManager = CLLocationManager()
        
        super.init()
        
        locationManager.delegate = self
    }
    
    func requestCurrentLocation(successful: @escaping (CLLocation) -> Void, failed: @escaping (Error) -> Void) {
        self.successful = successful
        self.failed = failed
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    //MARK : CLLocationManagerDelegate 
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        successful(locations.first!)
    }
    
    func  locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        failed(error)
    }
}



