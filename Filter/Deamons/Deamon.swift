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

let LocationDeamonDidUpdateLocationNotification =  Notification.Name("LocationDeamonDidUpdateLocationNotification")

class LocationDeamon: NSObject, Deamon, CLLocationManagerDelegate {
    private let locationManager: CLLocationManager
    private let storage: Storage
    private let requestFactory: RequestFactory
    private let networkClient: NetworkClient
    private let converter: UserConverter
    
    init(storage: Storage, requestFactory: RequestFactory, networkClient: NetworkClient, converter: UserConverter) {
        locationManager = CLLocationManager()
        self.storage = storage
        self.requestFactory = requestFactory
        self.networkClient = networkClient
        self.converter = converter
        
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.distanceFilter = 1
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
        updateMyCoordinate(locations.last!.coordinate)
    }
    
    func  locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    //MARK : Helpers
    
    private func updateMyCoordinate(_ coordinate: CLLocationCoordinate2D) {
        
        //Сохраняю новые координаты в storage
        storage.saveMyCoordiante(coordinate.latitude, coordinate.longitude)
        
        //Получаю необходимые данные для request, и формирую запрос
        guard let myProfile = storage.getMyProfile() else { return }
        guard let token = storage.getToken() else { return }
        let request = requestFactory.updateLastCoordinateRequest(userId: myProfile.id,
                                                                 latitude: coordinate.latitude,
                                                                 longitude: coordinate.longitude,
                                                                 token: token)
        
        //В случае успешного соединения сохраняю данные в storage и оповещаю о проделанных действиях при помощи нотификации
        networkClient.sendRequest(request: request,
                                  successful: { data in
                                    let closestUsers = self.converter.convertUsers(data)
                                    self.storage.saveClosestUsers(closestUsers)
                                    NotificationCenter.default.post(name: LocationDeamonDidUpdateLocationNotification, object: nil)
        }) { error in
            print("LocationDeamon \(error)")
        }
    }
}
