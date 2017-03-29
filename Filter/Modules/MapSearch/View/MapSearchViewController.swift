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
    func openChildViewController(_ childViewController: UIViewController)
}

protocol  MapSearchViewOutput: class {
    func viewDidLoad()
    func viewDidTapMarker(with id: Int)
}

class MapSearchViewController:UIViewController, MapSearchViewInput, GMSMapViewDelegate {
    weak var output: MapSearchViewOutput!
    
    private let mapView: GMSMapView
    private let markerInfoWindowView: UIView
    private var childViewController: UIViewController!
    
    init() {
        mapView = GMSMapView(frame: .zero)
        markerInfoWindowView = UIView(frame: .zero)
        markerInfoWindowView.backgroundColor = .red
        
        super.init(nibName: nil, bundle: nil)

        let styleURL = Bundle.main.url(forResource: "mapStyle", withExtension: "json")!
        mapView.mapStyle = try! GMSMapStyle(contentsOfFileURL: styleURL)
        mapView.delegate = self
    }
    
    func tap() {
        print("aregwerbwerb")
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
        markerInfoWindowView.frame = layout.markerInfoWindowViewFrame()
    }
    
    //MARK : MapSearchViewInput
    
    func upload(withLocation location: CLLocation) {
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 15)
        mapView.camera = camera
        let marker = GMSMarker(position: location.coordinate)
        marker.icon = UIImage(cgImage: #imageLiteral(resourceName: "my_marker_icon").cgImage!)
        marker.map = mapView
    }
    
    func openChildViewController(_ childViewController: UIViewController) {
        self.childViewController = childViewController
        addChildViewController(self.childViewController)
        self.childViewController.view.frame = markerInfoWindowView.bounds
        markerInfoWindowView.addSubview(self.childViewController.view)
        self.childViewController.didMove(toParentViewController: self)
    }
    
    //MARK : GMSMapViewDelegate
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        output.viewDidTapMarker(with: 44)
        return false
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        return markerInfoWindowView
    }
    
    func mapView(_ mapView: GMSMapView, didCloseInfoWindowOf marker: GMSMarker) {
        childViewController.willMove(toParentViewController: nil)
        childViewController.view.removeFromSuperview()
        childViewController.removeFromParentViewController()
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
    
    func markerInfoWindowViewFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width:253,
                      height: 198)
    }
}
