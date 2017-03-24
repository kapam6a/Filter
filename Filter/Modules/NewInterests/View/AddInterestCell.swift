//
//  File.swift
//  Filter
//
//  Created by admin5 on 13.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let cellIdentifier = "NewInterestsCellImpl"
}

struct AddInterestCellModel: BasicTableViewCellModel {
    var cellIdentifier: String {
        return Constants.cellIdentifier
    }
    var cellClass: AnyClass {
        return AddInterestCell.self
    }
    let name: String
    let plusButtonAction: (String) -> Void
}

class AddInterestCell: UITableViewCell, BasicTableViewCell{
    private let plusButton: UIButton
    private let titleLabel: UILabel
    
    private var plusButtonAction: ((String) -> Void)!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        plusButton = UIButton(type: .custom)
        titleLabel = UILabel(frame: .zero)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        plusButton.addTarget(self, action: #selector(didTapPlusButton(_ :)), for: .touchUpInside)
        plusButton.setImage(#imageLiteral(resourceName: "plus_icon"), for: .normal)
        contentView.addSubview(plusButton)
        
        titleLabel.font = DesignBook.Fonts.avtTextStyle3
        titleLabel.textAlignment = .center
        titleLabel.textColor = DesignBook.Colors.avtDarkSkyBlue
        contentView.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let layout = Layout(bounds: contentView.bounds)
        plusButton.frame = layout.plusButtonFrame()
        titleLabel.frame = layout.titleLabelFrame()
    }
    
    //MARK : BasicTableViewCell
    
    func configure(withCellModel cellModel: BasicTableViewCellModel) {
        let model = cellModel as! AddInterestCellModel
        titleLabel.text = model.name
        plusButtonAction = model.plusButtonAction
    }
    
    @objc func didTapPlusButton(_ sender: UIButton) {
        plusButtonAction(titleLabel.text!)
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    func titleLabelFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: bounds.width / 2,
                      height: bounds.height)
    }
    
    func plusButtonFrame() -> CGRect {
        return CGRect(x: bounds.width / 2,
                      y: bounds.height / 2 - 21 / 2,
                      width: 21,
                      height: 21)
    }
}

