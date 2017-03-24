//
//  File.swift
//  Filter
//
//  Created by admin5 on 21.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

struct WheelCollectionViewCellModel: WheelCellModel {
    var cellIdentifier: String {
        return "WheelCollectionViewCellModel"
    }
    var cellClass: AnyClass {
        return WheelCollectionViewCell.self
    }
    let value: Int
    let cellAction: () -> Void
}

class WheelCollectionViewCell: UICollectionViewCell, WheelCell {
    private let label: UILabel
    
    private var cellAction: (() -> Void)!
    
    override init(frame: CGRect) {
        label = UILabel(frame: .zero)
        
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
    
    func configure(withCellModel cellModel: WheelCellModel) {
        let model = cellModel as! WheelCollectionViewCellModel
        label.text = String(model.value)
        cellAction = model.cellAction
    }
    
    override var isSelected: Bool {
        didSet {
            cellAction()
        }
    }
}
