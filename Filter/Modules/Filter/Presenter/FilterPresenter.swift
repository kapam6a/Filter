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
    
    private var ageModule: AgeModule?
    private var newInterestsModule: NewInterestsModule?
    private var mapSearchModule: MapSearchModule?
    private var photosModule: PhotosModule?
    
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
    
    func viewDidTapMinAgeButton(_ minAge: Int) {
        router.openAgeModule { [unowned self] ageModule in
            self.ageModule = ageModule
            ageModule.configure(initialValue: minAge,
                                doneHandler: { [unowned self] newMinAge in
                                    self.interactor.didSelectMinAge(newMinAge)
                                    self.interactor.getCurrentFilterSettings()
                                    self.ageModule = nil
            })
        }
    }
    
    func viewDidTapMaxAgeButton(_ maxAge: Int) {
        router.openAgeModule { [unowned self] ageModule in
            self.ageModule = ageModule
            ageModule.configure(initialValue: maxAge,
                                doneHandler: { [unowned self] newMaxAge in
                                    self.interactor.didSelectMaxAge(newMaxAge)
                                    self.interactor.getCurrentFilterSettings()
                                    self.ageModule = nil
            })
        }
    }
    
    func viewDidTapSearchBar() {
        router.openInterestsModule { [unowned self] newInterestsModule in
            self.newInterestsModule = newInterestsModule
            newInterestsModule.configure(doneHandler: { [unowned self] newInterest in
                self.interactor.didSelectInterest(newInterest)
            })
        }
    }
    
    func viewDidTapMapButton() {
        router.openMapSearchModule { [unowned self] mapSearchModule in
            self.mapSearchModule = mapSearchModule
            mapSearchModule.configure(doneHandler: { [unowned self] newInterest in
                self.mapSearchModule = nil
            })
        }
    }
    
    func viewDidTapFilterButton() {
    
    }
    
    func viewDidTapDoneButton() {
        router.openPhotosModule { [unowned self] photosModule in
            self.photosModule = photosModule
            photosModule.configure(doneHandler: { [unowned self] selectedPhoto in
                self.mapSearchModule = nil
            })
        }
    }
    
    //MARK : FilterInteractorOutput
    
    func interactorDidGetFilterSettings(_ filterSettings: FilterSettings) {
        let sectionModels = modelsConverter.convertModels(withFilterSettings: filterSettings)
        view.update(withSectionModels: sectionModels)
    }
}

