//
//  File.swift
//  Filter
//
//  Created by admin5 on 14.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

class NewInterestsCellModelsConverter {
    private weak var viewOutput: NewInterestsViewOutput!
    
    init(withViewOutput viewOutput: NewInterestsViewOutput) {
        self.viewOutput = viewOutput
    }
    
    func convertModels(withInterests interests: [InterestsEntity]) -> [BasicTableViewCellModel]{
        var cellModels: [BasicTableViewCellModel] = []
                
        for entity in interests {
            let cellModel = AddInterestCellModel(name: entity.name,
                                                 plusButtonAction: { title in
                                                        self.viewOutput.viewDidTapPlusButton(withTitle: title)
                                                })
            cellModels.append(cellModel)
        }
        
        return cellModels
    }
}
