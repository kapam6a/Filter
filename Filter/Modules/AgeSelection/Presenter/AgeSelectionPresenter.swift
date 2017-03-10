//
//  FilterPresenter.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol AgeSelectionModule: class {
    var viewController: UIViewController { get }
    func configure(initialValue: Int, doneHandler: @escaping (Int) -> Void)
}

class AgeSelectionPresenter: AgeSelectionViewOutput, AgeSelectionModule, AgeSelectionInteractorOutput {
    var view: AgeSelectionViewInput!
    var interactor: AgeSelectionInteractorInput!
    var router: AgeSelectionRouterInput!
    
    private var initialValue: Int
    private var doneHandler: ((Int) -> Void)!
    
    init() {
        initialValue = 0
    }
    
    //MARK : AgeSelectionModule
    
    var viewController: UIViewController {
        return view as! UIViewController
    }
    
    func configure(initialValue: Int, doneHandler: @escaping (Int) -> Void) {
        self.initialValue = initialValue
        self.doneHandler = doneHandler
    }
    
    //MARK : AgeSelectionViewOutput
    
    func viewDidLoad() {
        view.update(withValue: initialValue)
    }
}

