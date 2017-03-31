//
//  MapService.swift
//  Filter
//
//  Created by admin5 on 17.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation
import CoreLocation

struct LocationEntity {
    let location: CLLocation
}

protocol LocationService {
    func requestCurrentLocation(successful: @escaping (LocationEntity) -> Void, failed: @escaping (Error) -> Void)
}

class LocationServiceImplementation: NSObject, LocationService, CLLocationManagerDelegate {
    private let locationManager: CLLocationManager
    
    private var successful: ((LocationEntity) -> Void)!
    private var failed: ((Error) -> Void)!
    
    override init() {
        locationManager = CLLocationManager()
        
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.distanceFilter = 1
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func requestCurrentLocation(successful: @escaping (LocationEntity) -> Void, failed: @escaping (Error) -> Void) {
        self.successful = successful
        self.failed = failed
    }
    
    //MARK : CLLocationManagerDelegate 
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations")
        successful(LocationEntity(location: locations.last!))
    }
    
    func  locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError")
        failed(error)
    }
}



