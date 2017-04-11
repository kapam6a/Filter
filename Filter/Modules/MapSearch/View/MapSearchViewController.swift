//
//  AgeSelectionViewController.swift
//  Filter
//
//  Created by admin5 on 07.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit
import GoogleMaps

protocol  MapSearchViewInput {
    func upload(with mapMarkerModels: [MapMarkerModel])
    func upload(with myMarkerModel: MapMarkerModel)
}

protocol  MapSearchViewOutput: class {
    func viewDidLoad()
    func viewDidTapMarker(with id: Int)
}

class MapSearchViewController:UIViewController, MapSearchViewInput, GMSMapViewDelegate {
    weak var output: MapSearchViewOutput!
    
    private let mapView: GMSMapView
    
    private var mapMarkers: [MapMarker]
    private var myMapMarker: MapMarker
    
    init() {
        mapView = GMSMapView(frame: .zero)
        mapMarkers = []
        myMapMarker = MapMarker(with: mapView)
        
        super.init(nibName: nil, bundle: nil)

        let styleURL = Bundle.main.url(forResource: "mapStyle", withExtension: "json")!
        mapView.mapStyle = try! GMSMapStyle(contentsOfFileURL: styleURL)
        mapView.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK : Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        
        output.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let layout = Layout(bounds: view.bounds)
        mapView.frame = layout.mapViewFrame()
    }
    
    //MARK : MapSearchViewInput
    
    func upload(with myMarkerModel: MapMarkerModel) {
        myMapMarker.removeFromMap()
        let camera = GMSCameraPosition.camera(withLatitude: myMarkerModel.location.coordinate.latitude,
                                              longitude: myMarkerModel.location.coordinate.longitude,
                                              zoom: myMarkerModel.zoom)
        mapView.camera = camera
        myMapMarker.configure(with: myMarkerModel)
    }
    
     func upload(with mapMarkerModels: [MapMarkerModel]) {
        mapMarkers.forEach { mapMarker in
            mapMarker.removeFromMap()
        }
        mapMarkerModels.forEach { mapMarkerModel in
            let marker = MapMarker(with: mapView)
            marker.configure(with: mapMarkerModel)
        }
    }
    
    //MARK : GMSMapViewDelegate
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        let marker = marker as! MapMarker
        output.viewDidTapMarker(with: marker.userId)
        return false
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    func mapViewFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: bounds.width ,
                      height: bounds.height)
    }
}
