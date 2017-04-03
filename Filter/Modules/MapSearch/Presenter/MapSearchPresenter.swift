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
        interactor.requestCurrentUser()
    }
    
    func viewDidTapMarker(with id: Int) {

    }

    //MARK : MapSearchInteractorOutput
    
    func interactorRequestCurrentUserDidFinish(withSuccess currentUser: UserEntity) {
        let currentMarkerModel = modelsConverter.convertCurrentMarkerModel(with: currentUser)
        view.upload(with: currentMarkerModel)
        
        interactor.requestCloseUsers()
    }
    
    func interactorRequestCloseUsersDidFinish(withSuccess closeUsers: [UserEntity]) {
        let markerModels = modelsConverter.convertMarkerModels(with: closeUsers)
        view.upload(with: markerModels)
    }
    
    func interactorRequestDidFail(withError error: Error) {
        
    }
}



