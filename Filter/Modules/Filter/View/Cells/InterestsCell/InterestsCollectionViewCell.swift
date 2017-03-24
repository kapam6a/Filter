//
//  File.swift
//  Filter
//
//  Created by admin5 on 10.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class InterestsCollectionViewCell: UICollectionViewCell {
    var title: String {
        didSet {
            titleLabel.text = title
        }
    }
    
    private let titleLabel: UILabel
    
    override init(frame: CGRect) {
        title = "Set text"
        titleLabel = UILabel(frame: .zero)
        
        super.init(frame: frame)
        
        layer.borderColor = DesignBook.Colors.avtDarkSkyBlue.cgColor
        layer.borderWidth = 1
        
        titleLabel.textColor = DesignBook.Colors.avtDarkSkyBlue
        titleLabel.textAlignment = .center
        titleLabel.font = DesignBook.Fonts.avtTextStyle3
        
        addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {        
        let layout = Layout(bounds: bounds)
        titleLabel.frame = layout.titleLabelFrame()
    }
    
    //MARK : Static methods
    
    static func size(title: String) -> CGSize {
        let textSize = title.size(attributes: [NSFontAttributeName: DesignBook.Fonts.avtTextStyle3])
        return CGSize(width: textSize.width + 10, height: textSize.height + 8)
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    func titleLabelFrame() -> CGRect {
        return bounds
    }
}
