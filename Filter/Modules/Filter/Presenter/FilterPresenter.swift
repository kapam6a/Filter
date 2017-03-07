//
//  FilterPresenter.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol FilterModuleInput: class {
    var viewController: UIViewController { get }
    
    func didSelectMinAge(_ minAge: Int)
    func didSelectMaxAge(_ maxAge: Int)
}

class FilterPresenter: FilterViewOutput, FilterInteractorOutput, FilterModuleInput {
    var view:FilterViewInput!
    var interactor: FilterInteractorInput!
    var router: FilterRouterInput!
    
    //MARK : FilterModuleInput
    
    var viewController: UIViewController {
        return view as! UIViewController
    }
    
    private var cellModelsConverter: FilterCellModelsConverter!
    private var moduleConfigurator: FilterModuleConfigurator!
    
    init() {
        cellModelsConverter = FilterCellModelsConverter(withViewOutput: self)
        moduleConfigurator = FilterModuleConfigurator(withModuleInput: self)
    }
    
    //MARK : FilterViewOutput
    
    func viewDidLoad() {
        interactor.getFilterSettings()
    }
    
    func viewDidTapMaleButton() {
        interactor.didSelectMale()
    }
    
    func viewDidTapFemaleButton() {
        interactor.didSelectFemale()
    }
    
    func viewDidTapMinAgeButton(_ minAge: String) {
        let configuration = moduleConfigurator.createMinAgeSelectionModuleConfiguration(withInitialValue: Int(minAge)!)
        router.openAgeSelectionModule(withConfiguration: configuration)
    }
    
    func viewDidTapMaxAgeButton(_ maxAge: String) {
        let configuration = moduleConfigurator.createMaxAgeSelectionModuleConfiguration(withInitialValue: Int(maxAge)!)
        router.openAgeSelectionModule(withConfiguration: configuration)
    }
    
    //MARK : FilterInteractorOutput
    
    func interactorDidGetFilterSettings(_ filterSettings: FilterSettings) {
        let cellModels = cellModelsConverter.convertModels(withFilterSettings: filterSettings)
        view.update(withCellModels: cellModels)
    }
    
    //MARK : FilterModuleInput
    
    func didSelectMinAge(_ minAge: Int) {
        interactor.didSelectMinAge(minAge)
    }
    
    func didSelectMaxAge(_ maxAge: Int) {
        interactor.didSelectMaxAge(maxAge)
    }
}

