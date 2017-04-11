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
    
    private var shortProfileModule: ShortProfileModule?
    
    init() {
        modelsConverter = MapModelsConverter(with: self)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didUpdateLocation),
                                               name: LocationDeamonDidUpdateLocationNotification,
                                               object: nil)
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
        interactor.requestMyProfile()
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
    
    func interactorRequestMyProfileDidFinish(withSuccess myProfile: UserEntity) {
        let myMarkerModel = modelsConverter.convertMyMarkerModel(with: myProfile)
        view.upload(with: myMarkerModel)
        
        interactor.requestClosestUsers()
    }
    
    func interactorRequestClosestUsersDidFinish(withSuccess closeUsers: [UserEntity]) {
        let markerModels = modelsConverter.convertMarkerModels(with: closeUsers)
        view.upload(with: markerModels)
    }
    
    func interactorRequestDidFail(withError error: Error) {
        
    }
    
    //MARK : NotificationCenter
    
    @objc func didUpdateLocation(_ notification: Notification) {
        interactor.requestMyProfile()
    }
}



