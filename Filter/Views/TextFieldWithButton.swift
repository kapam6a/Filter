//
//  File.swift
//  Filter
//
//  Created by admin5 on 14.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let defaultTextFieldPlaceHolder = ""
    static let defaultButtonTitle          = "Button"
}

protocol TextFieldWithButtonDelegate: class {
    func textFieldWithButtonDidTapClearButton(_ textFieldWithButton: TextFieldWithButton)
    func textFieldWithButtonDidTapButton(_ textFieldWithButton: TextFieldWithButton)
    func textFieldWithButton(_ textFieldWithButton: TextFieldWithButton, textDidChange text: String)
}

class TextFieldWithButton: UIView {
    private let textField: TextField
    private let button: UIButton
    private let separator: UIView
    
    var textFieldPlaceHolder: NSAttributedString {
        didSet {
            textField.attributedPlaceholder = textFieldPlaceHolder
        }
    }
    
    var buttonTitle: String {
        didSet {
            button.setTitle(buttonTitle, for: .normal)
        }
    }
    
    weak var delegate: TextFieldWithButtonDelegate?
    
    override init(frame: CGRect) {
        textField = TextField(frame: .zero)
        button = UIButton(type: .custom)
        separator = UIView(frame: .zero)
        textFieldPlaceHolder = NSAttributedString(string: Constants.defaultTextFieldPlaceHolder,
                                                  attributes: [NSForegroundColorAttributeName: DesignBook.Colors.secondary,
                                                               NSFontAttributeName: DesignBook.Fonts.elevenSizeSystemFontMedium])
        buttonTitle = Constants.defaultButtonTitle
        
        super.init(frame: frame)
        
        

        textField.defaultTextAttributes =  [NSForegroundColorAttributeName: DesignBook.Colors.primary,
                                            NSFontAttributeName: DesignBook.Fonts.elevenSizeSystemFontMedium]
        
        let clearButton = UIButton(type: .custom)
        clearButton.setImage(#imageLiteral(resourceName: "delete_icon"), for: .normal)
        clearButton.addTarget(self, action: #selector(didTapClearButton(_ : )), for: .touchUpInside)
        textField.rightView = clearButton
        textField.rightViewMode = .always
        textField.addTarget(self, action: #selector(didChangeText(_ : )), for: .editingChanged)
        addSubview(textField)
        
        button.setTitleColor(DesignBook.Colors.primary, for: .normal)
        button.titleLabel!.font = DesignBook.Fonts.thirteenSizeSystemFontMedium
        button.addTarget(self, action: #selector(didTapButton(_ : )), for: .touchUpInside)
        addSubview(button)
        
        separator.backgroundColor = DesignBook.Colors.secondary
        addSubview(separator)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let layout = Layout(bounds: bounds)
        button.frame = layout.buttonFrame()
        separator.frame = layout.separatorFrame()
        textField.frame = layout.textFieldFrame()
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
    
    private let separatorPadding: CGFloat = 22
    
    func buttonFrame() -> CGRect {
        return CGRect(x: bounds.width - 70,
                      y: 0,
                      width: 70,
                      height:bounds.height)
        
    }
    
    func separatorFrame() -> CGRect {
        return CGRect(x: buttonFrame().minX - separatorPadding,
                      y: bounds.height / 2 - bounds.height / 4,
                      width: 1,
                      height:bounds.height / 2)
        
    }
    
    func textFieldFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: separatorFrame().minX - separatorPadding,
                      height:bounds.height)
    }
}

class TextField: UITextField {
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.width - 11,
                      y: bounds.height / 2 - 11 / 2,
                      width: 11,
                      height:11)
    }
}
