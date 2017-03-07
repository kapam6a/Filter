//
//  File.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

struct AgeCellModel: FilterCellModel {
    var cellIdentifier: String {
        return "AgeCell"
    }
    var cellClass: AnyClass {
        return AgeCell.self
    }
    var footerTitle: String {
        return "возраст"
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
        minAgeButton.setBackgroundImage(UIImage(named: "oval_icon.png"), for: .normal)
        minAgeButton.setTitleColor(UIColor(red: 68 / 255.0, green: 192 / 255.0, blue: 241 / 255.0, alpha: 1.0), for: .normal)
        minAgeButton.titleLabel!.font = UIFont.systemFont(ofSize: 13)
        contentView.addSubview(minAgeButton)
        
        maxAgeButton.addTarget(self, action: #selector(didTapMaxAgeButton(_ :)), for: .touchUpInside)
        maxAgeButton.setBackgroundImage(UIImage(named: "oval_icon.png"), for: .normal)
        maxAgeButton.setTitleColor(UIColor(red: 68 / 255.0, green: 192 / 255.0, blue: 241 / 255.0, alpha: 1.0), for: .normal)
        maxAgeButton.titleLabel!.font = UIFont.systemFont(ofSize: 13)
        contentView.addSubview(maxAgeButton)
        
        fromLabel.text = "от"
        fromLabel.font = UIFont.systemFont(ofSize: 10)
        fromLabel.textAlignment = .center
        fromLabel.textColor = UIColor(red: 37 / 255.0, green: 115 / 255.0, blue: 191 / 255.0, alpha: 1.0)
        contentView.addSubview(fromLabel)
        
        toLabel.text = "до"
        toLabel.font = UIFont.systemFont(ofSize: 10)
        toLabel.textAlignment = .center
        toLabel.textColor = UIColor(red: 37 / 255.0, green: 115 / 255.0, blue: 191 / 255.0, alpha: 1.0)
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
        return CGRect(x: 47,
                      y: bounds.height / 2 - 31 / 2,
                      width: 31,
                      height: 31)
    }
    
    func maxAgeButtonFrame() -> CGRect {
        return CGRect(x: 131,
                      y: bounds.height / 2 - 31 / 2,
                      width: 31,
                      height: 31)
    }
    
    func fromLabelFrame() -> CGRect {
        return CGRect(x: 15,
                      y: bounds.height / 2 - 12 / 2,
                      width: 12,
                      height: 12)
    }
    
    func toLabelFrame() -> CGRect {
        return CGRect(x: 98,
                      y: bounds.height / 2 - 12 / 2,
                      width: 13,
                      height: 12)
    }
}
