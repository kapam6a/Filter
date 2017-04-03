//
//  File.swift
//  Filter
//
//  Created by admin5 on 03.04.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit
import CoreLocation

protocol Deamon {
    func start()
    func stop()
}

class LocationDeamon: NSObject, Deamon, CLLocationManagerDelegate {
    private let locationManager: CLLocationManager
    private let storage: Storage
    private let requestFactory: RequestFactory
    
    init(storage: Storage, requestFactory: RequestFactory) {
        locationManager = CLLocationManager()
        self.storage = storage
        self.requestFactory = requestFactory
            
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.distanceFilter = 50
        locationManager.requestWhenInUseAuthorization()
    }
    
    //MARK : Deamon
    
    func start() {
        locationManager.startUpdatingLocation()
    }
    
    func stop() {
        locationManager.stopUpdatingLocation()
    }
    
    //MARK : CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        updateLastUserCoordinate(locations.last!.coordinate)
    }
    
    func  locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    //MARK : Helpers
    
    private func updateLastUserCoordinate(_ coordinate: CLLocationCoordinate2D) {
        let userProfile = storage.getProfileInformation()
        let token = storage.getToken()
        let request = requestFactory.updateLastCoordinateRequest(userId: userProfile.id,
                                                                 latitude: coordinate.latitude,
                                                                 longitude: coordinate.longitude,
                                                                 token: token)
       
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            print(response!)
        }
        task.resume()
    }
}
