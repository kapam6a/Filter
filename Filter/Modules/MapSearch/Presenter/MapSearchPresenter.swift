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
    
    private var shortProfileModule: ShortProfileModule?
    
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
    
    func viewDidTapMarker(with id: Int) {
        router.openShortProfileModule { [unowned self] shortProfileModule in
            self.shortProfileModule = shortProfileModule
            shortProfileModule.configure(doneHandler: { [unowned self] in
                self.shortProfileModule = nil
            }, userId: id)
        }
    }

    //MARK : MapSearchInteractorOutput
    
    func interactorRequestCurrentLocationDidFinish(withSuccess location: CLLocation) {
        view.upload(withLocation: location)
    }
    
    func interactorRequestCurrentLocationDidFail(withError error: Error) {
        
    }
}



