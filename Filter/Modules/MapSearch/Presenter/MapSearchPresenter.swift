//
//  FilterPresenter.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit
import CoreLocation

protocol MapSearchModule: class {
    var viewController: UIViewController { get }
    func configure(doneHandler: @escaping (String) -> Void)
}

class MapSearchPresenter: MapSearchViewOutput, MapSearchModule, MapSearchInteractorOutput {
    var view: MapSearchViewInput!
    var interactor: MapSearchInteractorInput!
    var router: MapSearchRouterInput!
    
    private var doneHandler: ((String) -> Void)!
    private var modelsConverter: MapModelsConverter!
    
    init() {
        modelsConverter = MapModelsConverter(with: self)
    }
    
    //MARK : NewInterestsModule
    
    var viewController: UIViewController {
        return view as! UIViewController
    }
    
    func configure(doneHandler: @escaping (String) -> Void) {
        self.doneHandler = doneHandler
    }
    
    //MARK : MapSearchViewOutput
    
    func viewDidLoad() {
        interactor.requestCurrentLocation()
    }
    
    func viewDidTapMarker(with id: Int) {
        
    }

    //MARK : MapSearchInteractorOutput
    
    func interactorRequestCurrentLocationDidFinish(withSuccess locationEntity: LocationEntity) {
        let myMapMarkerModel = modelsConverter.convertMyModel(with: locationEntity)
        view.upload(with: myMapMarkerModel)
        
        interactor.requestSuitableUsers()
    }
    
    func interactorRequestCurrentLocationDidFail(withError error: Error) {
        
    }
}



