//
//  File.swift
//  Filter
//
//  Created by admin5 on 31.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit
import CoreLocation

class MapModelsConverter {
    private weak var viewOutput: MapSearchViewOutput!
    
    init(with viewOutput: MapSearchViewOutput) {
        self.viewOutput = viewOutput
    }
    
    func convertMarkerModels(with users: [UserEntity]) -> [MapMarkerModel] {
        var mapMarkerkModels: [MapMarkerModel] = []
        
        users.forEach{ user in
            var image = UIImage()
            
            if user.sex {
                image = #imageLiteral(resourceName: "male_marker_icon")
            } else {
                image = #imageLiteral(resourceName: "female_marker_icon")
            }
            let location = CLLocation(latitude: user.latitude,
                                      longitude: user.longitude)
            let mapMarkerModel = MapMarkerModel(image: image,
                                                location: location,
                                                userId: user.id,
                                                zoom: 0,
                                                status: user.status)
            mapMarkerkModels.append(mapMarkerModel)
        }
        return mapMarkerkModels
    }
    
    func convertMyMarkerModel(with user: UserEntity) -> MapMarkerModel {
        var image = UIImage()

        if user.sex {
            image = #imageLiteral(resourceName: "male_marker_icon")
        } else {
            image = #imageLiteral(resourceName: "female_marker_icon")
        }
        let location = CLLocation(latitude: user.latitude,
                                  longitude: user.longitude)
        
        return MapMarkerModel(image: image,
                              location: location,
                              userId: user.id,
                              zoom:18,
                              status: user.status)
    }
}
