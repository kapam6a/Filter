//
//  File.swift
//  Filter
//
//  Created by admin5 on 07.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

class FilterSectionModelsConverter {
    private weak var viewOutput: FilterViewOutput!
    
    init(withViewOutput viewOutput: FilterViewOutput) {
        self.viewOutput = viewOutput
    }
    
    func convertModels(withFilterSettings filterSettings: FilterSettings) -> [FilterSectionModel]{
        var sectionModels: [FilterSectionModel] = []
        
        let sexCellModel = SexCellModel(maleButtonIsSelected: filterSettings.male,
                                        femaleButtonIsSelected: filterSettings.female,
                                        maleButtonAction: { [unowned self] in
                                            self.viewOutput.viewDidTapMaleButton()
        }) { [unowned self] in
            self.viewOutput.viewDidTapFemaleButton()
        }
        let sexSection = FilterSectionModel(cellModels:[sexCellModel],
                                            footerTitle:"пол",
                                            headerTitle:"")
        sectionModels.append(sexSection)
        
        
        let ageCellModel = AgeCellModel(minAge: filterSettings.minAge,
                                        maxAge: filterSettings.maxAge,
                                        minAgeButtonAction: {[unowned self] minAge in
                                            self.viewOutput.viewDidTapMinAgeButton(minAge)
                                        },
                                        maxAgeButtonAction: {[unowned self] maxAge in
                                            self.viewOutput.viewDidTapMaxAgeButton(maxAge)
                                        })
        let ageSection = FilterSectionModel(cellModels:[ageCellModel],
                                            footerTitle:"возраст",
                                            headerTitle:"")
        sectionModels.append(ageSection)
        
    
        let interestsCellModel = InterestsCellModel(interests: filterSettings.interests)
        let searchCellModel = SearchCellModel { [unowned self] in
            self.viewOutput.viewDidTapSearchBar()
        }
        let interestsSection = FilterSectionModel(cellModels:[interestsCellModel, searchCellModel],
                                                  footerTitle:"интересы",
                                                  headerTitle:"выберите хэштег для поиска похожих интересов или использовать панель поиска")
        sectionModels.append(interestsSection)
        
        return sectionModels
    }
}
