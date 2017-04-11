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
    let status: String
}

class MapMarker: GMSMarker {
    var userId: Int!
    
    init(with map: GMSMapView ) {
        super.init()
        
        iconView = AnnotationMarkerView(frame: CGRect(x: 0, y: 0, width: 100, height: 110))
        self.map = map
        tracksViewChanges = true
    }
    
    func configure(with mapMarkerModel: MapMarkerModel) {
        position = mapMarkerModel.location.coordinate
        userId = mapMarkerModel.userId
        let annotationView = iconView as! AnnotationMarkerView
        annotationView.setup(title: mapMarkerModel.status,
                             image: mapMarkerModel.image)
    }
    
    func removeFromMap() {
        map = nil
    }
}





