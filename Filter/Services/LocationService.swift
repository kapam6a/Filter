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
    let latitude: Double
    let longitude: Double
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
    }
    
    func requestCurrentLocation(successful: @escaping (LocationEntity) -> Void, failed: @escaping (Error) -> Void) {
        self.successful = successful
        self.failed = failed
        
        locationManager.requestLocation()
    }
    
    //MARK : CLLocationManagerDelegate 
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let coordinate = locations.last!.coordinate
        self.successful(LocationEntity(latitude: coordinate.latitude,
                                      longitude: coordinate.longitude))
    }
    
    func  locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        failed(error)
    }
}



