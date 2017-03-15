//
//  FilterPresenter.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol NewInterestsModule: class {
    var viewController: UIViewController { get }
    func configure(doneHandler: @escaping (String) -> Void)
}

class NewInterestsPresenter: NewInterestsViewOutput, NewInterestsModule, NewInterestsInteractorOutput {
    var view: NewInterestsViewInput!
    var interactor: NewInterestsInteractorInput!
    var router: NewInterestsRouterInput!
    
    private var doneHandler: ((String) -> Void)!
    
    //MARK : NewInterestsModule
    
    var viewController: UIViewController {
        return view as! UIViewController
    }
    
    func configure(doneHandler: @escaping (String) -> Void) {
        self.doneHandler = doneHandler
    }
    
    private var cellModelsConverter: NewInterestsCellModelsConverter!
    
    init() {
        cellModelsConverter = NewInterestsCellModelsConverter(withViewOutput: self)
    }
    
    //MARK : NewInterestsViewOutput
    
    func viewDidLoad() {
        interactor.getInterests()
    }
    
    func viewDidTapPlusButton(withTitle title: String) {
        doneHandler(title)
    }
    
    func viewDidChange(searchText: String) {
        interactor.getInterests(withSearchText: searchText)
    }
    
    func viewDidTapCloseButton() {
        router.closeModule()
    }
    
     //MARK : NewInterestsInteractorOutput
    
    func interactorDidGetInterests(_ interests: [InterestsEntity]) {
        let cellModels = cellModelsConverter.convertModels(withInterests: interests)
        view.update(withCellModels: cellModels)
    }
}



