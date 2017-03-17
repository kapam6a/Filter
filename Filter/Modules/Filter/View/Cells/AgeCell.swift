//
//  File.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let cellIdentifier    = "AgeCell"
    static let fromLabelTitle    = "от"
    static let toLabelTitle      = "до"
}

struct AgeCellModel: FilterCellModel {
    var cellIdentifier: String {
        return Constants.cellIdentifier
    }
    var cellClass: AnyClass {
        return AgeCell.self
    }
    let minAge: String
    let maxAge: String
    let minAgeButtonAction: (_ minAge: String) -> Void
    let maxAgeButtonAction: (_ maxAge: String) -> Void
}

class AgeCell: UITableViewCell, FilterCell {
    private let minAgeButton: UIButton
    private let maxAgeButton: UIButton
    
    private var maxAgeButtonAction: ((String) -> Void)!
    private var minAgeButtonAction: ((String) -> Void)!
    
    private let fromLabel: UILabel
    private let toLabel: UILabel
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        maxAgeButton = UIButton(type: .custom)
        minAgeButton = UIButton(type: .custom)
        fromLabel = UILabel(frame: .zero)
        toLabel = UILabel(frame: .zero)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        minAgeButton.addTarget(self, action: #selector(didTapMinAgeButton(_ :)), for: .touchUpInside)
        minAgeButton.setBackgroundImage(#imageLiteral(resourceName: "oval_icon"), for: .normal)
        minAgeButton.setTitleColor(DesignBook.Colors.avtDarkSkyBlue, for: .normal)
        minAgeButton.titleLabel!.font = DesignBook.Fonts.avtTextStyle3
        contentView.addSubview(minAgeButton)
        
        maxAgeButton.addTarget(self, action: #selector(didTapMaxAgeButton(_ :)), for: .touchUpInside)
        maxAgeButton.setBackgroundImage(#imageLiteral(resourceName: "oval_icon"), for: .normal)
        maxAgeButton.setTitleColor(DesignBook.Colors.avtDarkSkyBlue, for: .normal)
        maxAgeButton.titleLabel!.font = DesignBook.Fonts.avtTextStyle3
        contentView.addSubview(maxAgeButton)
        
        fromLabel.text = Constants.fromLabelTitle
        fromLabel.font = DesignBook.Fonts.avtTextStyle2
        fromLabel.textAlignment = .left
        fromLabel.textColor = DesignBook.Colors.avtBluish
        contentView.addSubview(fromLabel)
        
        toLabel.text = Constants.toLabelTitle
        toLabel.font = DesignBook.Fonts.avtTextStyle2
        toLabel.textAlignment = .center
        toLabel.textColor = DesignBook.Colors.avtBluish
        contentView.addSubview(toLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let layout = Layout(bounds: contentView.bounds)
        minAgeButton.frame = layout.minAgeButtonFrame()
        maxAgeButton.frame = layout.maxAgeButtonFrame()
        fromLabel.frame = layout.fromLabelFrame()
        toLabel.frame = layout.toLabelFrame()
    }
    
    //MARK : FilterCell
    
    func configure(withCellModel cellModel: FilterCellModel) {
        let model = cellModel as! AgeCellModel
        minAgeButton.setTitle(model.minAge, for: .normal)
        maxAgeButton.setTitle(model.maxAge, for: .normal)
        minAgeButtonAction = model.minAgeButtonAction
        maxAgeButtonAction = model.maxAgeButtonAction
    }
    
    //MARK : Action

    @objc func didTapMinAgeButton(_ sender: UIButton) {
        minAgeButtonAction(minAgeButton.titleLabel!.text!)
    }
    
    @objc func didTapMaxAgeButton(_ sender: UIButton) {
        minAgeButtonAction(maxAgeButton.titleLabel!.text!)
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    func minAgeButtonFrame() -> CGRect {
        return CGRect(x: 32,
                      y: bounds.height / 2 - 31 / 2,
                      width: 31,
                      height: 31)
    }
    
    func maxAgeButtonFrame() -> CGRect {
        return CGRect(x: 116,
                      y: bounds.height / 2 - 31 / 2,
                      width: 31,
                      height: 31)
    }
    
    func fromLabelFrame() -> CGRect {
        return CGRect(x: 0,
                      y: bounds.height / 2 - 12 / 2,
                      width: 15,
                      height: 15)
    }
    
    func toLabelFrame() -> CGRect {
        return CGRect(x: 83,
                      y: bounds.height / 2 - 12 / 2,
                      width: 15,
                      height: 15)
    }
}
