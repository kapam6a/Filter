//
//  File.swift
//  Filter
//
//  Created by admin5 on 23.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let cellIdentifier  = "CareerTableViewCell"
    static let ageLabelText    = "ВОЗРАСТ"
    static let careerLabelText = "КАРЬЕРА"
}

struct CareerCellModel: BasicTableViewCellModel {
    var cellClass: AnyClass {
        return CareerTableViewCell.self
    }
    var cellIdentifier: String {
        return Constants.cellIdentifier
    }
    let age: Int
    let career: String
}

class CareerTableViewCell: TableViewCellWithSeparator, BasicTableViewCell {
    private let container: UIView
    
    private let ageValueLabel: UILabel
    private let ageLabel: UILabel
    private let careerValueLabel: UILabel
    private let careerLabel: UILabel
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        container = UIView(frame: .zero)
        
        ageValueLabel = UILabel(frame: .zero)
        ageLabel = UILabel(frame: .zero)
        careerValueLabel = UILabel(frame: .zero)
        careerLabel = UILabel(frame: .zero)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(container)
        
        ageValueLabel.textColor = DesignBook.Colors.avtWhite
        ageValueLabel.font = DesignBook.Fonts.avtTextStyle3
        container.addSubview(ageValueLabel)
        
        ageLabel.textColor = DesignBook.Colors.avtDarkSkyBlue
        ageLabel.font = DesignBook.Fonts.avtTextStyle1
        ageLabel.text = Constants.ageLabelText
        container.addSubview(ageLabel)
        
        careerValueLabel.textColor = DesignBook.Colors.avtWhite
        careerValueLabel.font = DesignBook.Fonts.avtTextStyle3
        container.addSubview(careerValueLabel)
        
        careerLabel.textColor = DesignBook.Colors.avtDarkSkyBlue
        careerLabel.font = DesignBook.Fonts.avtTextStyle1
        careerLabel.text = Constants.careerLabelText
        container.addSubview(careerLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = Layout(bounds: contentView.bounds)
        container.frame = layout.containerFrame()
        ageValueLabel.frame = layout.ageValueLabelFrame()
        ageValueLabel.frame.size = ageValueLabel.sizeThatFits(.zero)
        ageLabel.frame = layout.ageLabelFrame()
        careerValueLabel.frame = layout.careerValueLabelFrame()
        careerValueLabel.frame.size = careerValueLabel.sizeThatFits(.zero)
        careerLabel.frame = layout.careerLabelFrame()
    }
    
    //MARK : BasicTableViewCell
    
    func configure(withCellModel cellModel: BasicTableViewCellModel) {
        let model = cellModel as! CareerCellModel
        ageValueLabel.text = String(model.age)
        careerValueLabel.text = model.career
    }
}


fileprivate struct Layout {
    let bounds: CGRect
    
    let valueLabelHeight: CGFloat = 13
    let labelHeight: CGFloat = 11
    let labelWidth: CGFloat = 45
    let padding: CGFloat = 1
    let leftOffset: CGFloat = 74
    
    func containerFrame() -> CGRect {
        let height: CGFloat = valueLabelHeight + labelHeight + padding
        return CGRect(x: 0,
                      y: bounds.height / 2 - height / 2,
                      width: bounds.width,
                      height: height)
    }

    
    func ageValueLabelFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: 0,
                      height: valueLabelHeight)
    }
    
    func ageLabelFrame() -> CGRect {
        return CGRect(x: 0,
                      y: valueLabelHeight + padding,
                      width: labelWidth,
                      height: labelHeight)
    }
    
    func careerValueLabelFrame() -> CGRect {
        return CGRect(x: leftOffset,
                      y: 0,
                      width: 0,
                      height: valueLabelHeight)
    }
    
    func careerLabelFrame() -> CGRect {
        return CGRect(x: leftOffset,
                      y: valueLabelHeight + padding,
                      width: labelWidth,
                      height: labelHeight)
    }
}
