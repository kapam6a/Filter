//
//  File.swift
//  Filter
//
//  Created by admin5 on 27.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol BasicCollectionViewCellModel {
    var cellIdentifier: String { get }
    var cellClass: AnyClass { get }
}

protocol BasicCollectionViewCell {
    func configure(withCellModel cellModel: BasicCollectionViewCellModel)
}
