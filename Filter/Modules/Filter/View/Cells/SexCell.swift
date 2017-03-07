//
//  FilterTableViewCells.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

struct SexCellModel: FilterCellModel {
    var cellIdentifier: String {
        return "SexCell"
    }
    var cellClass: AnyClass {
        return SexCell.self
    }
    var footerTitle: String {
        return "пол"
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
        femaleButton.setImage(UIImage(named: "famale_icon_normal.png"), for: .normal)
        femaleButton.setImage(UIImage(named: "female_icon_selected.png"), for: .selected)
        femaleButton.setTitle("женский", for: .normal)
        femaleButton.setTitleColor(UIColor(red: 69 / 255.0, green: 192 / 255.0, blue: 241 / 255.0, alpha: 1.0), for: .normal)
        femaleButton.setTitleColor(UIColor(red: 255 / 255.0, green: 255 / 255.0, blue: 255 / 255.0, alpha: 1.0), for: .selected)
        femaleButton.titleLabel!.font = UIFont.systemFont(ofSize: 11)
        femaleButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        contentView.addSubview(femaleButton)
        
        maleButton.addTarget(self, action: #selector(didTapMaleButton(_ :)), for: .touchUpInside)
        maleButton.setImage(UIImage(named: "male_icon_normal.png"), for: .normal)
        maleButton.setImage(UIImage(named: "male_icon_selected.png"), for: .selected)
        maleButton.setTitle("мужской", for: .normal)
        maleButton.setTitleColor(UIColor(red: 69 / 255.0, green: 192 / 255.0, blue: 241 / 255.0, alpha: 1.0), for: .normal)
        maleButton.setTitleColor(UIColor(red: 255 / 255.0, green: 255 / 255.0, blue: 255 / 255.0, alpha: 1.0), for: .selected)
        maleButton.titleLabel!.font = UIFont.systemFont(ofSize: 11)
        maleButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        contentView.addSubview(maleButton)

        middleLabel.text = "или"
        middleLabel.font = UIFont.systemFont(ofSize: 10)
        middleLabel.textAlignment = .center
        middleLabel.textColor = UIColor(red: 37 / 255.0, green: 115 / 255.0, blue: 191 / 255.0, alpha: 1.0)
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
                      width: 19,
                      height: 12)
    }
}

