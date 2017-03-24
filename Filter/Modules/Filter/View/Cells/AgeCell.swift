//
//  File.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let cellIdentifier  = "AgeCell"
    static let fromLabelTitle  = "от"
    static let toLabelTitle    = "до"
}

struct AgeCellModel: BasicTableViewCellModel {
    var cellIdentifier: String {
        return Constants.cellIdentifier
    }
    var cellClass: AnyClass {
        return AgeCell.self
    }
    let minAge: Int
    let maxAge: Int
    let minAgeButtonAction: (_ minAge: Int) -> Void
    let maxAgeButtonAction: (_ maxAge: Int) -> Void
}

class AgeCell: UITableViewCell, BasicTableViewCell {
    private let minAgeButton: UIButton
    private let maxAgeButton: UIButton
    
    private var maxAgeButtonAction: ((Int) -> Void)!
    private var minAgeButtonAction: ((Int) -> Void)!
    
    private let fromLabel: UILabel
    private let toLabel: UILabel
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        maxAgeButton = UIButton(type: .custom)
        minAgeButton = UIButton(type: .custom)
        fromLabel = UILabel(frame: .zero)
        toLabel = UILabel(frame: .zero)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        minAgeButton.addTarget(self, action: #selector(didTapMinAgeButton), for: .touchUpInside)
        minAgeButton.setBackgroundImage(#imageLiteral(resourceName: "oval_icon"), for: .normal)
        minAgeButton.setTitleColor(DesignBook.Colors.avtDarkSkyBlue, for: .normal)
        minAgeButton.titleLabel!.font = DesignBook.Fonts.avtTextStyle3
        contentView.addSubview(minAgeButton)
        
        maxAgeButton.addTarget(self, action: #selector(didTapMaxAgeButton), for: .touchUpInside)
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
    
    //MARK : BasicTableViewCell
    
    func configure(withCellModel cellModel: BasicTableViewCellModel) {
        let model = cellModel as! AgeCellModel
        minAgeButton.setTitle(String(model.minAge), for: .normal)
        maxAgeButton.setTitle(String(model.maxAge), for: .normal)
        minAgeButtonAction = model.minAgeButtonAction
        maxAgeButtonAction = model.maxAgeButtonAction
    }
    
    //MARK : Action

    @objc func didTapMinAgeButton(_ sender: UIButton) {
        minAgeButtonAction(NSDecimalNumber(string: minAgeButton.titleLabel?.text).intValue)
    }
    
    @objc func didTapMaxAgeButton(_ sender: UIButton) {
        maxAgeButtonAction(NSDecimalNumber(string: maxAgeButton.titleLabel?.text).intValue)
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
