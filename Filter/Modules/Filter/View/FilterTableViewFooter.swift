//
//  FilterTableViewFooter.swift
//  Filter
//
//  Created by admin5 on 07.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class FilterTableViewFooter: UITableViewHeaderFooterView {
    var title: String {
        didSet {
            titleLabel.text = title
        }
    }
    
    private let separator: UIView
    private let titleLabel: UILabel
    
    override init(reuseIdentifier: String?) {
        separator = UIView(frame: .zero)
        separator.backgroundColor = DesignBook.Colors.secondary
        
        titleLabel = UILabel(frame: .zero)
        titleLabel.font = DesignBook.Fonts.tableViewFooterFont
        titleLabel.textColor = DesignBook.Colors.secondary
        title = ""
        
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(separator)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let layout = Layout(bounds: self.bounds)
        separator.frame = layout.separatorFrame()
        titleLabel.frame = layout.titleLabelFrame()
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    func separatorFrame() -> CGRect {
        return CGRect(x: 15,
                      y: 1,
                      width: bounds.width - (15 * 2),
                      height: 1)
    }
    
    func titleLabelFrame() -> CGRect {
        return CGRect(x: 15,
                      y: bounds.height / 2 - 20 / 2,
                      width: 80,
                      height: 20)
    }
}
