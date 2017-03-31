//
//  File.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

protocol FilterInteractorInput {
    func getFilterSettings()
    func getCurrentFilterSettings()
    func didSelectMale()
    func didSelectFemale()
    func didSelectMinAge(_ minAge: Int)
    func didSelectMaxAge(_ maxAge: Int)
    func didSelectInterest(_ interest: String)
}

protocol FilterInteractorOutput:class {
    func interactorDidGetFilterSettings(_ filterSettings: FilterSettings)
}

class FilterSettings {
    var male: Bool!
    var female: Bool!
    var minAge: Int!
    var maxAge: Int!
    var interests: [String]!
}

class FilterInteractor: FilterInteractorInput {
    weak var output: FilterInteractorOutput!
    
    private var currentFilterSettings: FilterSettings!
    
    private let searchSettingsService: SearchSettingsService
    
    init(withSearchSettingsService searchSettingsService: SearchSettingsService) {
        self.searchSettingsService = searchSettingsService
        currentFilterSettings = FilterSettings()
    }
    
    //MARK : FilterInteractorInput
    
    func getFilterSettings() {
        searchSettingsService.requestSearchSettings(successful: { searchSettings in
            self.currentFilterSettings.male = searchSettings.male
            self.currentFilterSettings.female = searchSettings.female
            self.currentFilterSettings.minAge = searchSettings.minAge
            self.currentFilterSettings.maxAge = searchSettings.maxAge
            self.currentFilterSettings.interests = searchSettings.interests
            
            self.output.interactorDidGetFilterSettings(self.currentFilterSettings)
        }) { error in
            
        }
    }
    
    func getCurrentFilterSettings() {
        output.interactorDidGetFilterSettings(currentFilterSettings)
    }
    
    func didSelectMale() {
        currentFilterSettings.male = !currentFilterSettings.male
    }
    
    func didSelectFemale() {
        currentFilterSettings.female = !currentFilterSettings.female
    }
    
    func didSelectMinAge(_ minAge: Int) {
        currentFilterSettings.minAge = minAge
    }
    
    func didSelectMaxAge(_ maxAge: Int) {
        currentFilterSettings.maxAge = maxAge
    }
    
    func didSelectInterest(_ interest: String) {
        currentFilterSettings.interests.append(interest)
    }
}
