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
    func didSelectMale()
    func didSelectFemale()
    func didSelectMinAge(_ minAge: Int)
    func didSelectMaxAge(_ maxAge: Int)
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
        let searchSettingsEntity = searchSettingsService.requestSearchSettings()
        
        currentFilterSettings.male = searchSettingsEntity.male
        currentFilterSettings.female = searchSettingsEntity.female
        currentFilterSettings.minAge = searchSettingsEntity.minAge
        currentFilterSettings.maxAge = searchSettingsEntity.maxAge
        currentFilterSettings.interests = searchSettingsEntity.interests

        output.interactorDidGetFilterSettings(currentFilterSettings)
    }
    
    func didSelectMale() {
        currentFilterSettings.male = !currentFilterSettings.male
    }
    
    func didSelectFemale() {
        currentFilterSettings.female = !currentFilterSettings.female
    }
    
    func didSelectMinAge(_ minAge: Int) {
        
    }
    
    func didSelectMaxAge(_ maxAge: Int) {
        
    }
}
