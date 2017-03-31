//
//  File.swift
//  Filter
//
//  Created by admin5 on 21.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class WheelCollectionViewCell: UICollectionViewCell {
    var value: Int {
        didSet {
           label.text = String(value)
        }
    }
    
    private let label: UILabel
    
    override init(frame: CGRect) {
        label = UILabel(frame: .zero)
        value = 0
        
        super.init(frame: frame)
        
        label.textAlignment = .center
        label.textColor = DesignBook.Colors.avtDarkSkyBlue
        label.font = DesignBook.Fonts.avtTextStyle1
        
        contentView.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        let circularlayoutAttributes = layoutAttributes as! CircularCollectionViewLayoutAttributes
        self.layer.anchorPoint = circularlayoutAttributes.anchorPoint
        self.center.y += (circularlayoutAttributes.anchorPoint.y - 0.5) * self.bounds.height
    }
}
