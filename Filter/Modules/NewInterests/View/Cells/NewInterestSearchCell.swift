//
//  NewInterestSearchCell.swift
//  Filter
//
//  Created by admin5 on 14.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let textFieldPlaceHolder = "Поиск по интересам"
    static let cellIdentifier = "NewInterestSearchCell"
}

struct NewInterestsSearchCellModel: NewInterestsCellModel {
    var cellIdentifier: String {
        return Constants.cellIdentifier
    }
    var cellClass: AnyClass {
        return NewInterestSearchCell.self
    }
    let buttonTitle: String
    let textFieldAction: (String) -> Void
    let buttonAction: () -> Void
}

class NewInterestSearchCell: UITableViewCell, NewInterestsCell, TextFieldWithButtonDelegate {
    private var buttonAction: (() -> Void)!
    private var textFieldAction: ((String) -> Void)!
    
    private let textFieldWithButton: TextFieldWithButton
    private let loupe: UIImageView

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        textFieldWithButton = TextFieldWithButton(frame: .zero)
        loupe = UIImageView(image: #imageLiteral(resourceName: "search_icon"))
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        textFieldWithButton.textFieldPlaceHolder = NSAttributedString(string: Constants.textFieldPlaceHolder,
                                                                      attributes: [NSForegroundColorAttributeName: DesignBook.Colors.secondary,
                                                                                   NSFontAttributeName: DesignBook.Fonts.elevenSizeSystemFontMedium])
        textFieldWithButton.delegate = self
        contentView.addSubview(textFieldWithButton)
        
        contentView.addSubview(loupe)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let layout = Layout(bounds: bounds)
        textFieldWithButton.frame = layout.textFieldWithButtonFrame()
        loupe.frame = layout.loupeFrame()
    }
    
    //MARK : NewInterestsCell
    
    func configure(withCellModel cellModel: NewInterestsCellModel) {
        let model = cellModel as! NewInterestsSearchCellModel
        buttonAction = model.buttonAction
        textFieldAction = model.textFieldAction
        textFieldWithButton.buttonTitle = model.buttonTitle
    }
    
    //MARK : TextFieldWithButtonDelegate
    
    func textFieldWithButtonDidTapClearButton(_ textFieldWithButton: TextFieldWithButton) {
        textFieldAction("")
    }
    
    func textFieldWithButtonDidTapButton(_ textFieldWithButton: TextFieldWithButton) {
        buttonAction()
    }
    
    func textFieldWithButton(_ textFieldWithButton: TextFieldWithButton, textDidChange text: String) {
        textFieldAction(text)
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    func loupeFrame() -> CGRect {
        return CGRect(x: 0,
                      y: bounds.height / 2 -  15 / 2,
                      width: 15,
                      height: 15)
    }
    
    func textFieldWithButtonFrame() -> CGRect {
        let x = loupeFrame().maxX + 10
        return CGRect(x: x,
                      y: 0,
                      width: bounds.width - x,
                      height: bounds.height)
    }
}
