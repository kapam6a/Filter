//
//  File.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

struct InterestsCellModel: FilterCellModel {
    var cellIdentifier: String {
        return "InterestsCell"
    }
    var cellClass: AnyClass {
        return InterestsCell.self
    }
    var footerTitle: String {
        return "интересы"
    }
    let interests: [String]
}

class InterestsCell: UITableViewCell, FilterCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(withCellModel cellModel: FilterCellModel) {
        
    }
}
