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
    func upload(withLocation location: CLLocation)
}

protocol  MapSearchViewOutput: class {
    func viewDidLoad()
}

class MapSearchViewController:UIViewController, MapSearchViewInput {
    weak var output: MapSearchViewOutput!
    
    private let mapView: GMSMapView
    
    init() {
        mapView = GMSMapView(frame: .zero)
        
        super.init(nibName: nil, bundle: nil)
        
        let styleURL = Bundle.main.url(forResource: "mapStyle", withExtension: "json")!
        mapView.mapStyle = try! GMSMapStyle(contentsOfFileURL: styleURL)
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
    
    func upload(withLocation location: CLLocation) {
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 15)
        mapView.camera = camera
        let marker = GMSMarker(position: location.coordinate)
        marker.icon = UIImage(cgImage: #imageLiteral(resourceName: "my_marker_icon").cgImage!)
        marker.title = "Ты тут"
        marker.map = mapView
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
