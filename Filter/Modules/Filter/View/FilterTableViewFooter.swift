//
//  FilterTableViewFooter.swift
//  Filter
//
//  Created by admin5 on 07.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class FilterTableViewFooter: UITableViewHeaderFooterView {
    var separatorColor: UIColor {
        didSet {
            separator.backgroundColor = separatorColor
        }
    }
    var title: String {
        didSet {
            titleLabel.text = title
        }
    }
    
    private let separator: UIView
    private let titleLabel: UILabel
    
    override init(reuseIdentifier: String?) {
        separator = UIView(frame: .zero)
        separatorColor = UIColor(red: 63 / 255.0, green: 128 / 255.0, blue: 203 / 255.0, alpha: 1.0)
        
        titleLabel = UILabel(frame: .zero)
        titleLabel.font = UIFont.systemFont(ofSize: 9)
        titleLabel.textColor = UIColor(red: 69 / 255.0, green: 192 / 255.0, blue: 241 / 255.0, alpha: 1.0)
        title = ""
        
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(separator)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let layout = Layout(bounds: contentView.bounds)
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
