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

    //MARK : MapSearchInteractorOutput
    
    func interactorRequestDidFinish(withSuccess location: CLLocation) {
        view.upload(withLocation: location)
    }
    
    func interactorRequestDidFail(withError error: Error) {
        
    }
}



