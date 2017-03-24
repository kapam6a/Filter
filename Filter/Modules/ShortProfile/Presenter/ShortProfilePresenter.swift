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
    func configure(doneHandler: @escaping () -> Void)
}

class ShortProfilePresenter: ShortProfileViewOutput, ShortProfileModule, ShortProfileInteractorOutput {
    var view: ShortProfileViewInput!
    var interactor: ShortProfileInteractorInput!
    var router: ShortProfileRouterInput!
    
    private var doneHandler: (() -> Void)!
    
    //MARK : NewInterestsModule
    
    var viewController: UIViewController {
        return view as! UIViewController
    }
    
    func configure(doneHandler: @escaping () -> Void) {
        self.doneHandler = doneHandler
    }
    
    private var cellModelsConverter: ShortProfileCellModelsConverter!
    
    init() {
        cellModelsConverter = ShortProfileCellModelsConverter(withViewOutput: self)
    }
    
    //MARK : ShortProfileViewOutput
    
    func viewDidLoad() {

    }
    
     //MARK : ShortProfileInteractorOutput
}



