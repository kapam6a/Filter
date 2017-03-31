//
//  FilterPresenter.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol ShortProfileModule: class {
    var viewController: UIViewController { get }
    func configure(doneHandler: @escaping () -> Void, userId: Int)
}

class ShortProfilePresenter: ShortProfileViewOutput, ShortProfileModule, ShortProfileInteractorOutput {
    var view: ShortProfileViewInput!
    var interactor: ShortProfileInteractorInput!
    var router: ShortProfileRouterInput!
    
    private var doneHandler: (() -> Void)!
    private var userId: Int!
    
    //MARK : ShortProfileModule
    
    var viewController: UIViewController {
        return view as! UIViewController
    }
    
    func configure(doneHandler: @escaping () -> Void, userId: Int) {
        self.doneHandler = doneHandler
        self.userId = userId
    }
    
    private var cellModelsConverter: ShortProfileCellModelsConverter!
    
    init() {
        cellModelsConverter = ShortProfileCellModelsConverter(withViewOutput: self)
    }
    
    //MARK : ShortProfileViewOutput
    
    func viewDidLoad() {
        view.goIntoLoadingState()
        interactor.requestUserProfile(with: userId)
    }
    
    func viewDidTapChatButton() {
        
    }
    
    func viewDidTapFavoriteButton() {
        
    }
    
    func viewDidTapRouteButton() {
        
    }
    
    func viewDidTapOnMapButton() {
        
    }
    
    func viewDidTapFacebookButton() {
        
    }
    
    func viewDidTapInstagramButton() {
        
    }
    
    func viewDidTapThreeDotsButton() {
        
    }
    
     //MARK : ShortProfileInteractorOutput
    
    func interactorRequestUserProfileDidFinish(withSuccess profileEntity: UserProfileEntity) {
        view.goIntoNormalState()
        let cellModels = cellModelsConverter.convertModels(with: profileEntity)
        view.update(withCellModels: cellModels)
    }
    
    func interactorRequestUserProfileDidFail(withError error: Error) {
        view.goIntoNormalState()
        view.goIntoErrorState(with: error)
    }
}



