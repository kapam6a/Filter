//
//  File.swift
//  Filter
//
//  Created by admin5 on 10.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class InterestsCollectionViewCell: UICollectionViewCell {
    let titleLabel: UILabel
    
    override init(frame: CGRect) {
        titleLabel = UILabel(frame: .zero)
        
        super.init(frame: frame)
        
        layer.borderColor = DesignBook.Colors.primary.cgColor
        layer.borderWidth = 1
        
        titleLabel.textColor = DesignBook.Colors.primary
        titleLabel.textAlignment = .center
        titleLabel.font = DesignBook.Fonts.elevenSizeSystemFontMedium
        
        addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {        
        let layout = Layout(bounds: bounds)
        titleLabel.frame = layout.titleLabelFrame()
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    func titleLabelFrame() -> CGRect {
        return bounds
    }
}
