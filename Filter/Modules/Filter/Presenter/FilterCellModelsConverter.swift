//
//  File.swift
//  Filter
//
//  Created by admin5 on 07.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

class FilterCellModelsConverter {
    private weak var viewOutput: FilterViewOutput!
    
    init(withViewOutput viewOutput: FilterViewOutput) {
        self.viewOutput = viewOutput
    }
    
    func convertModels(withFilterSettings filterSettings: FilterSettings) -> [FilterCellModel]{
        var cellModels: [FilterCellModel] = []
        
        let sexCellModel = SexCellModel(maleButtonIsSelected: filterSettings.male,
                                        femaleButtonIsSelected: filterSettings.female,
                                        maleButtonAction: {
                                            self.viewOutput.viewDidTapMaleButton()
        }) {
            self.viewOutput.viewDidTapFemaleButton()
        }
        cellModels.append(sexCellModel)
        
        let ageCellModel = AgeCellModel(minAge: String(filterSettings.minAge),
                                        maxAge: String(filterSettings.maxAge),
                                        minAgeButtonAction: { minAge in
                                            self.viewOutput.viewDidTapMinAgeButton(minAge)
        }) { maxAge in
            self.viewOutput.viewDidTapMaxAgeButton(maxAge)
        }
        cellModels.append(ageCellModel)
        
        let interestsCellModel = InterestsCellModel(interests: filterSettings.interests)
        cellModels.append(interestsCellModel)
        
        return cellModels
    }
}
