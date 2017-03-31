//
//  File.swift
//  Filter
//
//  Created by admin5 on 31.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class MapModelsConverter {
    private weak var viewOutput: MapSearchViewOutput!
    
    init(with viewOutput: MapSearchViewOutput) {
        self.viewOutput = viewOutput
    }
    
    func convertModels(with locationEntities: [LocationEntity]) -> [MapMarkerModel] {
        var mapMarkerkModels: [MapMarkerModel] = []
        
        locationEntities.forEach{ locationEntitie in
            var image = UIImage()
            
//            if locationEntitie.sex == 1 {
//                image = #imageLiteral(resourceName: "male_marker_icon")
//            } else {
//                image = #imageLiteral(resourceName: "female_marker_icon")
//            }
            
            let mapMarkerModel = MapMarkerModel(image: #imageLiteral(resourceName: "male_marker_icon"),
                                                location: locationEntitie.location,
                                                userId: 1,
                                                zoom: 0)
            mapMarkerkModels.append(mapMarkerModel)
        }
        return mapMarkerkModels
    }
    
    func convertMyModel(with locationEntity: LocationEntity) -> MapMarkerModel {
            return MapMarkerModel(image: #imageLiteral(resourceName: "my_marker_icon"),
                                  location: locationEntity.location,
                                  userId: 0,
                                  zoom:18)
          }

}
