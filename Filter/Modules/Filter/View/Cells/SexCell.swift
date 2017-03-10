//
//  FilterTableViewCells.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let cellIdentifier    = "SexCell"
    static let footerTitle       = "пол"
    static let femaleButtonTitle = "женский"
    static let maleButtonTitle   = "мужской"
    static let middleLabelTitle  = "или"
    static let footerIdentifier  = "FilterTableViewFooter"
    static let headerTitle       = ""
    
    static let buttonTitleLeftOffset:CGFloat = 10
}

struct SexCellModel: FilterCellModel {
    var cellIdentifier: String {
        return Constants.cellIdentifier
    }
    var cellClass: AnyClass {
        return SexCell.self
    }
    var footerClass: AnyClass {
        return FilterTableViewFooter.self
    }
    var footerIdentifier: String {
        return Constants.footerIdentifier
    }
    var footerTitle: String {
        return Constants.footerTitle
    }
    var headerTitle: String {
        return Constants.headerTitle
    }
    let maleButtonIsSelected: Bool
    let femaleButtonIsSelected: Bool
    let maleButtonAction: () -> Void
    let femaleButtonAction: () -> Void
}

class SexCell: UITableViewCell, FilterCell {
    private let maleButton: UIButton
    private let femaleButton: UIButton
    private let middleLabel: UILabel
    
    private var maleButtonAction: (() -> Void)!
    private var femaleButtonAction: (() -> Void)!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        femaleButton = UIButton(type: .custom)
        maleButton = UIButton(type: .custom)
        middleLabel = UILabel(frame: .zero)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        femaleButton.addTarget(self, action: #selector(didTapFemaleButton(_ :)), for: .touchUpInside)
        femaleButton.setImage(#imageLiteral(resourceName: "female_icon_normal"), for: .normal)
        femaleButton.setImage(#imageLiteral(resourceName: "female_icon_selected"), for: .selected)
        femaleButton.setTitle(Constants.femaleButtonTitle, for: .normal)
        femaleButton.setTitleColor(DesignBook.Colors.primary, for: .normal)
        femaleButton.setTitleColor(DesignBook.Colors.selected, for: .selected)
        femaleButton.titleLabel!.font = DesignBook.Fonts.elevenSizeSystemFontMedium
        femaleButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: Constants.buttonTitleLeftOffset, bottom: 0, right: 0)
        contentView.addSubview(femaleButton)
        
        maleButton.addTarget(self, action: #selector(didTapMaleButton(_ :)), for: .touchUpInside)
        maleButton.setImage(#imageLiteral(resourceName: "male_icon_normal"), for: .normal)
        maleButton.setImage(#imageLiteral(resourceName: "male_icon_selected"), for: .selected)
        maleButton.setTitle(Constants.maleButtonTitle, for: .normal)
        maleButton.setTitleColor(DesignBook.Colors.primary, for: .normal)
        maleButton.setTitleColor(DesignBook.Colors.selected, for: .selected)
        maleButton.titleLabel!.font = DesignBook.Fonts.elevenSizeSystemFontMedium
        maleButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: Constants.buttonTitleLeftOffset, bottom: 0, right: 0)
        contentView.addSubview(maleButton)

        middleLabel.text = Constants.middleLabelTitle
        middleLabel.font = DesignBook.Fonts.tenSizeSystemFontMedium
        middleLabel.textAlignment = .center
        middleLabel.textColor = DesignBook.Colors.secondary
        contentView.addSubview(middleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let layout = Layout(bounds: contentView.bounds)
        maleButton.frame = layout.maleButtonFrame()
        femaleButton.frame = layout.femaleButtonFrame()
        middleLabel.frame = layout.middleLabelFrame()
    }
    
    //MARK : FilterCell
    
    func configure(withCellModel cellModel: FilterCellModel) {
        let model = cellModel as! SexCellModel
        maleButton.isSelected = model.maleButtonIsSelected
        femaleButton.isSelected = model.femaleButtonIsSelected
        maleButtonAction = model.maleButtonAction
        femaleButtonAction = model.femaleButtonAction
    }
    
    //MARK : Action
    
    @objc func didTapMaleButton(_ sender: UIButton) {
        maleButton.isSelected = !maleButton.isSelected
        maleButtonAction()
    }
    
    @objc func didTapFemaleButton(_ sender: UIButton) {
        femaleButton.isSelected = !femaleButton.isSelected
        femaleButtonAction()
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    func maleButtonFrame() -> CGRect {
        return CGRect(x: 133,
                      y: bounds.height / 2 - 30 / 2,
                      width: 98,
                      height: 30)
    }
    
    func femaleButtonFrame() -> CGRect {
        return CGRect(x: 15,
                      y: bounds.height / 2 - 30 / 2,
                      width: 98,
                      height: 30)
    }
    
    func middleLabelFrame() -> CGRect {
        return CGRect(x: 114,
                      y: bounds.height / 2 - 12 / 2,
                      width: 22,
                      height: 12)
    }
}

