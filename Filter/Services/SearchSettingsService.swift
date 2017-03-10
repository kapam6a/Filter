//
//  SeatchFilterService.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

struct SearchSettingsEntity {
    let male: Bool
    let female: Bool
    let minAge: Int
    let maxAge: Int
    let interests: [String]
}

protocol SearchSettingsService {
    func requestSearchSettings() -> SearchSettingsEntity
}

class SearchSettingsServiceImpl: SearchSettingsService{
    func requestSearchSettings() -> SearchSettingsEntity {
        return SearchSettingsEntity(male: true,
                                    female: true,
                                    minAge: 26,
                                    maxAge: 33,
                                    interests: ["witch-house", "rapcore", "dogs", "auto - layout", "horror - movie"])
    }
}
