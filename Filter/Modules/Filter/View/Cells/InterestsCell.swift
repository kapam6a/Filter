//
//  File.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let cellIdentifier    = "InterestsCell"
    static let footerTitle       = "интересы"
    static let footerIdentifier  = "FilterTableViewFooter"
    static let headerTitle       = "выберите хэштег для поиска похожих интересов или использовать панель поиска"
}

struct InterestsCellModel: FilterCellModel {
    var cellIdentifier: String {
        return Constants.cellIdentifier
    }
    var cellClass: AnyClass {
        return InterestsCell.self
    }
    var footerTitle: String {
        return Constants.footerTitle
    }
    var footerClass: AnyClass {
        return FilterTableViewFooter.self
    }
    var footerIdentifier: String {
        return Constants.footerIdentifier
    }
    var headerTitle: String {
        return Constants.headerTitle
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
