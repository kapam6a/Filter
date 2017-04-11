//
//  File.swift
//  Filter
//
//  Created by admin5 on 04.04.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class AnnotationMarkerView: UIView {
    private let titleLabel: Label
    private let bigOval: UIView
    private let smallOval: UIView
    private let imageView: UIImageView
    
    override init(frame: CGRect) {
        titleLabel = Label(frame: .zero)
        bigOval = UIView(frame: .zero)
        smallOval = UIView(frame: .zero)
        imageView = UIImageView(frame: .zero)
        
        super.init(frame: frame)
        
        titleLabel.backgroundColor = DesignBook.Colors.avtWhite
        titleLabel.layer.borderColor = DesignBook.Colors.avtDarkSkyBlue.cgColor
        titleLabel.layer.borderWidth = 1
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.font = DesignBook.Fonts.avtTextStyle1
        titleLabel.clipsToBounds = true
        addSubview(titleLabel)
        
        bigOval.backgroundColor = DesignBook.Colors.avtWhite
        bigOval.layer.borderColor = DesignBook.Colors.avtDarkSkyBlue.cgColor
        bigOval.layer.borderWidth = 1
        addSubview(bigOval)
        
        smallOval.backgroundColor = DesignBook.Colors.avtWhite
        smallOval.layer.borderColor = DesignBook.Colors.avtDarkSkyBlue.cgColor
        smallOval.layer.borderWidth = 1
        addSubview(smallOval)
        
        addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = Layout(bounds: bounds)
        titleLabel.frame = layout.titleLabelFrame()
        titleLabel.layer.cornerRadius = titleLabel.frame.height / 2
        bigOval.frame = layout.bigOvalFrame()
        bigOval.layer.cornerRadius = bigOval.frame.height / 2
        smallOval.frame = layout.smallOvalFrame()
        smallOval.layer.cornerRadius = smallOval.frame.height / 2
        imageView.frame = layout.imageViewFrame()
    }
    
    //MARK : Public methods
    
    func setup(title: String, image: UIImage) {
        titleLabel.text = title
        imageView.image = image
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    private let bigOvalSide: CGFloat = 8
    private let smallOvalSide: CGFloat = 4
    private let imageViewSide: CGFloat = 48
    
    private let space: CGFloat = 6
    
    func titleLabelFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: bounds.width,
                      height: bounds.height - space - bigOvalSide - space - smallOvalSide - space - imageViewSide)
    }
    
    func bigOvalFrame() -> CGRect {
        return CGRect(x: bounds.width / 2 - bigOvalSide,
                      y: titleLabelFrame().maxY + space,
                      width: bigOvalSide,
                      height: bigOvalSide)
    }

    func smallOvalFrame() -> CGRect {
        return CGRect(x: bounds.width / 2 - smallOvalSide,
                      y: bigOvalFrame().maxY + space,
                      width: smallOvalSide,
                      height: smallOvalSide)
    }
    
    func imageViewFrame() -> CGRect {
        return CGRect(x: bounds.width / 2 - imageViewSide / 2,
                      y: smallOvalFrame().maxX + space,
                      width: imageViewSide,
                      height: imageViewSide)
    }
}
