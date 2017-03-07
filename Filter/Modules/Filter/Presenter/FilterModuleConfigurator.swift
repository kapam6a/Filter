//
//  FilterModuleConfigurator.swift
//  Filter
//
//  Created by admin5 on 07.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

class FilterModuleConfigurator {
    private weak var moduleInput: FilterModuleInput!
    
    init(withModuleInput moduleInput: FilterModuleInput) {
        self.moduleInput = moduleInput
    }
    
    func createMinAgeSelectionModuleConfiguration(withInitialValue initialValue: Int) -> AgeSelectionModuleConfiguration {
        return AgeSelectionModuleConfiguration(initialValue: initialValue,
                                               handler: { newValue in
                                                  self.moduleInput.didSelectMinAge(newValue)
                                               })
    }
    
    func createMaxAgeSelectionModuleConfiguration(withInitialValue initialValue: Int) -> AgeSelectionModuleConfiguration {
        return AgeSelectionModuleConfiguration(initialValue: initialValue,
                                               handler: { newValue in
                                                 self.moduleInput.didSelectMaxAge(newValue)
                                               })
    }
}
