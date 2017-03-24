//
//  File.swift
//  Filter
//
//  Created by admin5 on 23.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol BasicTableViewCellModel {
    var cellIdentifier: String { get }
    var cellClass: AnyClass { get }
}

protocol BasicTableViewCell {
    func configure(withCellModel cellModel: BasicTableViewCellModel)
}
