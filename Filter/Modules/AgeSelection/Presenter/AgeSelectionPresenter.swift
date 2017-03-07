//
//  FilterPresenter.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol AgeSelectionModuleInput: class {
    var viewController: UIViewController { get }
}

class AgeSelectionPresenter: AgeSelectionViewOutput, AgeSelectionModuleInput, AgeSelectionInteractorOutput {
    var view: AgeSelectionViewInput!
    var interactor: AgeSelectionInteractorInput!
    var router: AgeSelectionRouterInput!
    
    //MARK : AgeSelectionModuleInput
    
    var viewController: UIViewController {
        return view as! UIViewController
    }
}

