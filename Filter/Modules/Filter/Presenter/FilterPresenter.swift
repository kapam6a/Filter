//
//  FilterPresenter.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol FilterModule: class {
    var viewController: UIViewController { get }
}

class FilterPresenter: FilterViewOutput, FilterInteractorOutput, FilterModule {
    var view:FilterViewInput!
    var interactor: FilterInteractorInput!
    var router: FilterRouterInput!
    
    private var modelsConverter: FilterSectionModelsConverter!
    
    //MARK : FilterModuleInput
    
    var viewController: UIViewController {
        return view as! UIViewController
    }
    
    init() {
        modelsConverter = FilterSectionModelsConverter(withViewOutput: self)
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
        router.openAgeModule { (ageModule) in
            ageModule.configure(initialValue: Int(minAge)!,
                                doneHandler: { [unowned self] (newMinAge) in
                                    self.interactor.didSelectMinAge(newMinAge)
                                })
        }
    }
    
    func viewDidTapMaxAgeButton(_ maxAge: String) {
        router.openAgeModule { (ageModule) in
            ageModule.configure(initialValue: Int(maxAge)!,
                                doneHandler: { [unowned self] (newMaxAge) in
                                    self.interactor.didSelectMaxAge(newMaxAge)
                                })
        }
    }
    
    func viewDidTapSearchBar() {
        router.openInterestsModule { (interestsModule) in
            interestsModule.configure(doneHandler: { (newInterest) in
                                         self.interactor.didSelectInterest(newInterest)
                                      })
        }
    }
    
    //MARK : FilterInteractorOutput
    
    func interactorDidGetFilterSettings(_ filterSettings: FilterSettings) {
        let sectionModels = modelsConverter.convertModels(withFilterSettings: filterSettings)
        view.update(withSectionModels: sectionModels)
    }
}

