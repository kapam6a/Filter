//
//  File.swift
//  Filter
//
//  Created by admin5 on 07.04.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation
import MapKit

class MapKitViewController:UIViewController, MapSearchViewInput, MKMapViewDelegate {
    weak var output: MapSearchViewOutput!
    
    private let mapView: MKMapView
    
    private var mapMarkers: [MapMarker]!
    private var myMapMarker: MapMarker!
    
    init() {
        mapView = MKMapView(frame: .zero)

        super.init(nibName: nil, bundle: nil)

        mapView.delegate = self
        
        let template = "https://api.mapbox.com/styles/v1/vadimpianof/ciy19qag600b62rqls4094fy8/tiles/256/{1}/{1}/{0}@2x?access_token=pk.eyJ1IjoidmFkaW1waWFub2YiLCJhIjoiY2lycHpvbnhqMDBhbWhxbTF5b3NjYThkbyJ9.RM2GxLZsw6ag-5hjLUmzWg"
        
        let overlay = MKTileOverlay(urlTemplate: template)
        overlay.canReplaceMapContent = true
        
        mapView.add(overlay, level: .aboveLabels)
    }
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        guard let tileOverlay = overlay as? MKTileOverlay else {
            return MKOverlayRenderer()
        }
        
        return MKTileOverlayRenderer(tileOverlay: tileOverlay)
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

    }
    
    func upload(with mapMarkerModels: [MapMarkerModel]) {
    
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
    
    func markerInfoWindowFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: 100,
                      height: 60)
    }
    
}
