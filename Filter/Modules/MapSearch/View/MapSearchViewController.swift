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
    func upload(with currentMarkerModel: MapMarkerModel)
}

protocol  MapSearchViewOutput: class {
    func viewDidLoad()
    func viewDidTapMarker(with id: Int)
}

class MapSearchViewController:UIViewController, MapSearchViewInput, GMSMapViewDelegate {
    weak var output: MapSearchViewOutput!
    
    private let mapView: GMSMapView
    
    private var mapMarkerModels: [MapMarkerModel]!
    private var myMapMarkerModel: MapMarkerModel!
    
    init() {
        mapView = GMSMapView(frame: .zero)
        
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
    
    func upload(with currentMarkerModel: MapMarkerModel) {
        let camera = GMSCameraPosition.camera(withLatitude: myMapMarkerModel.location.coordinate.latitude,
                                              longitude: myMapMarkerModel.location.coordinate.longitude,
                                              zoom: myMapMarkerModel.zoom)
        mapView.camera = camera
        let myMarker = MapMarker(with: mapView)
        myMarker.configure(with: myMapMarkerModel)
    }
    
     func upload(with mapMarkerModels: [MapMarkerModel]) {
        mapMarkerModels.forEach { mapMarkerModel in
            let marker = MapMarker(with: mapView)
            marker.configure(with: myMapMarkerModel)
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
