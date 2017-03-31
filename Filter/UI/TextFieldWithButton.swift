//
//  File.swift
//  Filter
//
//  Created by admin5 on 14.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let defaultPlaceHolder = "Введите слово"
    static let defaultButtonTitle = "Button"
}

protocol TextFieldWithButtonDelegate: class {
    func textFieldWithButtonDidTapClearButton(_ textFieldWithButton: TextFieldWithButton)
    func textFieldWithButtonDidTapButton(_ textFieldWithButton: TextFieldWithButton)
    func textFieldWithButton(_ textFieldWithButton: TextFieldWithButton, textDidChange text: String)
}

class TextFieldWithButton: UIView {
    private let textField: TextFieldWithFixedRightView
    private let button: UIButton
    private let divider: UIView
    private let loupe: UIImageView
    private let showLoupe: Bool
    private let separator: UIView
    
    var placeHolder: String {
        didSet {
            textField.attributedPlaceholder = NSAttributedString(string: placeHolder,
                                                                 attributes: [NSForegroundColorAttributeName: DesignBook.Colors.avtBluish,
                                                                             NSFontAttributeName: DesignBook.Fonts.avtTextStyle3])
        }
    }
    
    var buttonTitle: String {
        didSet {
            button.setTitle(buttonTitle, for: .normal)
        }
    }
    
    weak var delegate: TextFieldWithButtonDelegate?
    
    init(frame: CGRect, showLoupe: Bool) {
        textField = TextFieldWithFixedRightView(frame: .zero)
        button = UIButton(type: .custom)
        divider = UIView(frame: .zero)
        placeHolder = ""
        buttonTitle =  ""
        loupe = UIImageView(image: #imageLiteral(resourceName: "search_icon"))
        separator = UIView(frame: .zero)
        self.showLoupe = showLoupe
 
        super.init(frame: frame)

        textField.defaultTextAttributes = [NSForegroundColorAttributeName: DesignBook.Colors.avtDarkSkyBlue,
                                           NSFontAttributeName: DesignBook.Fonts.avtTextStyle3]
        textField.attributedPlaceholder = NSAttributedString(string: Constants.defaultPlaceHolder,
                                                             attributes: [NSForegroundColorAttributeName: DesignBook.Colors.avtBluish,
                                                                          NSFontAttributeName: DesignBook.Fonts.avtTextStyle3])
        let clearButton = UIButton(type: .custom)
        clearButton.setImage(#imageLiteral(resourceName: "delete_icon"), for: .normal)
        clearButton.addTarget(self, action: #selector(didTapClearButton(_ : )), for: .touchUpInside)
        textField.rightView = clearButton
        textField.rightViewMode = .always
        textField.addTarget(self, action: #selector(didChangeText(_ : )), for: .editingChanged)
        addSubview(textField)
        
        button.setTitleColor(DesignBook.Colors.avtDarkSkyBlue, for: .normal)
        button.setTitleColor(DesignBook.Colors.avtWhite, for: .highlighted)
        button.titleLabel!.font = DesignBook.Fonts.avtTextStyle3
        button.setTitle(Constants.defaultButtonTitle, for: .normal)
        button.addTarget(self, action: #selector(didTapButton(_ : )), for: .touchUpInside)
        addSubview(button)
        
        divider.backgroundColor = DesignBook.Colors.avtBluish
        addSubview(divider)
        
        if showLoupe {
            addSubview(loupe)
        }
        
        separator.backgroundColor = DesignBook.Colors.avtBluish
        addSubview(separator)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let layout = Layout(bounds: bounds,
                            button: button,
                            showLoupe: showLoupe)
        loupe.frame = layout.loupeFrame()
        button.frame = layout.buttonFrame()
        divider.frame = layout.dividerFrame()
        textField.frame = layout.textFieldFrame()
        separator.frame = layout.separatorFrame()
    }
    
    //MARK : Actions
    
    @objc func didTapClearButton(_ sender :UIButton) {
        textField.text = ""
        textField.resignFirstResponder()
        delegate?.textFieldWithButtonDidTapClearButton(self)
    }
    
    @objc func didChangeText(_ textField :UITextField) {
        delegate?.textFieldWithButton(self, textDidChange: textField.text!)
    }
    
    @objc func didTapButton(_ sender: UIButton) {
        delegate?.textFieldWithButtonDidTapButton(self)
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    let button: UIButton
    let showLoupe: Bool
    
    private let dividerPadding: CGFloat = 22
    private let loupeSide: CGFloat = 15
    private let textFieldLeftOffset: CGFloat = 10
    
    func loupeFrame() -> CGRect {
        return CGRect(x: 0,
                      y: bounds.height / 2 - loupeSide / 2,
                      width: loupeSide,
                      height: loupeSide)
    }
    
    func buttonFrame() -> CGRect {
        let textSize = button.titleLabel!.sizeThatFits(.zero)
        return CGRect(x: bounds.width - textSize.width,
                      y: 0,
                      width: textSize.width,
                      height:bounds.height)
        
    }
    
    func dividerFrame() -> CGRect {
        return CGRect(x: buttonFrame().minX - dividerPadding,
                      y: bounds.height / 2 - bounds.height / 4,
                      width: 1,
                      height:bounds.height / 2)
        
    }
    
    func textFieldFrame() -> CGRect {
        let x = loupeFrame().maxX + textFieldLeftOffset
        return CGRect(x: x,
                      y: 0,
                      width: dividerFrame().minX - dividerPadding - x,
                      height:bounds.height)
    }
    
    func separatorFrame() -> CGRect {
        return CGRect(x: 0,
                      y: bounds.height - 1,
                      width: bounds.width,
                      height: 1)
    }
}
