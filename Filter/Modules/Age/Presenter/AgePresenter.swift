//
//  FilterPresenter.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol AgeModule: class {
    var viewController: UIViewController { get }
    func configure(initialValue: Int, doneHandler: @escaping (Int) -> Void)
}

class AgePresenter: AgeViewOutput, AgeModule, AgeInteractorOutput {
    var view: AgeViewInput!
    var interactor: AgeInteractorInput!
    var router: AgeRouterInput!
    
    private var initialValue: Int
    private var doneHandler: ((Int) -> Void)!
    
    init() {
        initialValue = 0
    }
    
    //MARK : AgeModule
    
    var viewController: UIViewController {
        return view as! UIViewController
    }
    
    func configure(initialValue: Int, doneHandler: @escaping (Int) -> Void) {
        self.initialValue = initialValue
        self.doneHandler = doneHandler
    }
    
    //MARK : AgeViewOutput
    
    func viewDidLoad() {
        view.update(withValue: initialValue)
    }
    
    func viewDidSelect(age: Int) {
        view.update(withValue: age)
        doneHandler(age)
        router.closeModule()
    }
}
