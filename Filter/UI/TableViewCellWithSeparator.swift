//
//  File.swift
//  Filter
//
//  Created by admin5 on 28.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class TableViewCellWithSeparator: UITableViewCell {
    let separator: UIView
        
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        separator = UIView(frame: .zero)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        separator.backgroundColor = DesignBook.Colors.avtBluish
        contentView.addSubview(separator)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = Layout(bounds: bounds)
        separator.frame = layout.separatorFrame()
        bringSubview(toFront: separator)
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    private let separatorHeight: CGFloat = 1
    
    func separatorFrame() -> CGRect {
        return CGRect(x: 0,
                      y: bounds.height - separatorHeight,
                      width: bounds.width ,
                      height: separatorHeight)
    }
}
