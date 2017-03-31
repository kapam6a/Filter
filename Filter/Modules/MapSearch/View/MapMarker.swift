//
//  File.swift
//  Filter
//
//  Created by admin5 on 31.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps

struct MapMarkerModel {
    let image: UIImage
    let location: CLLocation
    let userId: Int
    let zoom: Float
}

class MapMarker: GMSMarker {
    var userId: Int!
    
    init(with map: GMSMapView ) {
        super.init()
        
        self.map = map
    }
    
    func configure(with mapMarkerModel: MapMarkerModel) {
        position = mapMarkerModel.location.coordinate
        icon = mapMarkerModel.image
        userId = mapMarkerModel.userId
    }
}





