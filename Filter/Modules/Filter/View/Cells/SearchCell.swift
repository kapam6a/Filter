//
//  File.swift
//  Filter
//
//  Created by admin5 on 14.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let cellIdentifier  = "SearchCell"
    static let title           = "Поиск по интересам"
}

struct SearchCellModel: BasicTableViewCellModel {
    var cellIdentifier: String {
        return Constants.cellIdentifier
    }
    var cellClass: AnyClass {
        return SearchCell.self
    }
    let searchCellAction: () -> Void
}

class SearchCell: UITableViewCell, BasicTableViewCell, UITextFieldDelegate {
    private let loupe: UIImageView
    private let textField: UITextField
    
    private var searchCellAction: (() -> Void)!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        loupe = UIImageView(image: #imageLiteral(resourceName: "search_icon"))
        textField = UITextField(frame: .zero)

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        textField.font = DesignBook.Fonts.avtTextStyle3
        textField.attributedPlaceholder = NSAttributedString(string: Constants.title,
                                                             attributes: [NSForegroundColorAttributeName: DesignBook.Colors.avtBluish])
        
        textField.delegate = self
        contentView.addSubview(textField)
        
        contentView.addSubview(loupe)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let layout = Layout(bounds: contentView.bounds)
        loupe.frame = layout.loupeFrame()
        textField.frame = layout.textFieldFrame()
    }
    
    //MARK : BasicTableViewCell
    
    func configure(withCellModel cellModel: BasicTableViewCellModel) {
        let model = cellModel as! SearchCellModel
        searchCellAction = model.searchCellAction
    }
    
    //MARK : UITextFieldDelegate
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        searchCellAction()
        return false
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    func loupeFrame() -> CGRect {
        return CGRect(x: 0,
                      y: bounds.height / 2 - 15 / 2,
                      width: 15,
                      height: 15)
    }
    
    func textFieldFrame() -> CGRect {
        let x = loupeFrame().maxX + 10
        return CGRect(x: x ,
                      y: 0,
                      width: bounds.width - x,
                      height: bounds.height)
    }
}
