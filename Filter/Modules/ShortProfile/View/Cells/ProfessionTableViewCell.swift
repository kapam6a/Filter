//
//  File.swift
//  Filter
//
//  Created by admin5 on 23.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let cellIdentifier = "ProfessionTableViewCell"
}

struct ProfessionCellModel: BasicTableViewCellModel {
    var cellClass: AnyClass {
        return StatusTableViewCell.self
    }
    var cellIdentifier: String {
        return Constants.cellIdentifier
    }
}

class ProfessionTableViewCell: UITableViewCell, BasicTableViewCell {
    private let ageValueLabel: UILabel
    private let ageLabel: UILabel
    private let professionValueLabel: UILabel
    private let professionLabel: UILabel
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        ageValueLabel = UILabel(frame: .zero)
        ageLabel = UILabel(frame: .zero)
        professionValueLabel = UILabel(frame: .zero)
        professionLabel = UILabel(frame: .zero)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        ageValueLabel.textColor = DesignBook.Colors.avtWhite
        ageValueLabel.font = DesignBook.Fonts.avtTextStyle4
        contentView.addSubview(ageValueLabel)
        
        ageLabel.textColor = DesignBook.Colors.avtWhite
        ageLabel.font = DesignBook.Fonts.avtTextStyle4
        contentView.addSubview(ageLabel)
        
        professionValueLabel.textColor = DesignBook.Colors.avtWhite
        professionValueLabel.font = DesignBook.Fonts.avtTextStyle4
        contentView.addSubview(professionValueLabel)
        
        professionLabel.textColor = DesignBook.Colors.avtWhite
        professionLabel.font = DesignBook.Fonts.avtTextStyle4
        contentView.addSubview(professionLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = Layout(bounds: contentView.bounds)
        ageValueLabel.frame = layout.ageValueLabelFrame()
        ageLabel.frame = layout.ageLabelFrame()
        professionValueLabel.frame = layout.professionValueLabelFrame()
        professionLabel.frame = layout.professionLabelFrame()
    }
    
    //MARK : BasicTableViewCell
    
    func configure(withCellModel cellModel: BasicTableViewCellModel) {
        let model = cellModel as! ProfessionCellModel
    }
}


fileprivate struct Layout {
    let bounds: CGRect
    
    func ageValueLabelFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: bounds.width,
                      height: bounds.height)
    }
    
    func ageLabelFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: bounds.width,
                      height: bounds.height)
    }
    
    func professionValueLabelFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: bounds.width,
                      height: bounds.height)
    }
    
    func professionLabelFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: bounds.width,
                      height: bounds.height)
    }
}
