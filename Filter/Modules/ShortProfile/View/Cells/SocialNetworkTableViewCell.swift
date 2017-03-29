//
//  File.swift
//  Filter
//
//  Created by admin5 on 23.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let cellIdentifier = "SocialNetworkTableViewCell"
}

struct SocialNetworkCellModel: BasicTableViewCellModel {
    var cellClass: AnyClass {
        return SocialNetworkTableViewCell.self
    }
    var cellIdentifier: String {
        return Constants.cellIdentifier
    }
    let facebookButtonAction: () -> Void
    let instagramButtonAction: () -> Void
    let threeDotsButtonAction: () -> Void
}

class SocialNetworkTableViewCell: UITableViewCell, BasicTableViewCell {
    private let facebookButton: UIButton
    private let instagramButton: UIButton
    private let threeDotsButton: UIButton
    
    private var facebookButtonAction: (() -> Void)!
    private var instagramButtonAction: (() -> Void)!
    private var threeDotsButtonAction: (() -> Void)!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        facebookButton = UIButton(type: .custom)
        instagramButton = UIButton(type: .custom)
        threeDotsButton = UIButton(type: .custom)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        facebookButton.setImage(#imageLiteral(resourceName: "facebook_logo_icon"), for: .normal)
        facebookButton.setTitle("facebоok", for: .normal)
        facebookButton.titleLabel?.font = DesignBook.Fonts.avtTextStyle2
        facebookButton.addTarget(self, action: #selector(didTapFacebookButton), for: .touchUpInside)
        contentView.addSubview(facebookButton)
        
        instagramButton.setImage(#imageLiteral(resourceName: "instagram_logo_icon"), for: .normal)
        instagramButton.setTitle("instagram", for: .normal)
        instagramButton.titleLabel?.font = DesignBook.Fonts.avtTextStyle2
        instagramButton.addTarget(self, action:#selector(didTapInstagramButton), for: .touchUpInside)
        contentView.addSubview(instagramButton)
        
        threeDotsButton.setImage(#imageLiteral(resourceName: "threedots_Icon"), for: .normal)
        threeDotsButton.addTarget(self, action:#selector(didTapThreeDotsButton), for: .touchUpInside)
        contentView.addSubview(threeDotsButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = Layout(bounds: contentView.bounds)
        facebookButton.frame = layout.facebookButtonFrame()
        instagramButton.frame = layout.instagramButtonFrame()
        threeDotsButton.frame = layout.threeDotsButtonFrame()
    }
    
    //MARK : BasicTableViewCell
    
    func configure(withCellModel cellModel: BasicTableViewCellModel) {
        let model = cellModel as! SocialNetworkCellModel
        facebookButtonAction = model.facebookButtonAction
        instagramButtonAction = model.instagramButtonAction
        threeDotsButtonAction = model.threeDotsButtonAction
    }
    
    //MARK : Action methods
    
    func didTapFacebookButton() {
        facebookButtonAction()
    }
    
    func didTapInstagramButton() {
        instagramButtonAction()
    }
    
    func didTapThreeDotsButton() {
        threeDotsButtonAction()
    }
}


fileprivate struct Layout {
    let bounds: CGRect
    
    private let buttonWidth: CGFloat = 75
    private let buttonHeight: CGFloat = 17
    
    
    func facebookButtonFrame() -> CGRect {
        return CGRect(x: 0,
                      y: bounds.height / 2 - buttonHeight / 2,
                      width: buttonWidth,
                      height: buttonHeight)
    }
    
    func instagramButtonFrame() -> CGRect {
        return CGRect(x: bounds.width / 2 - buttonWidth / 2,
                      y: bounds.height / 2 - buttonHeight / 2,
                      width: buttonWidth,
                      height: buttonHeight)
    }
    
    func threeDotsButtonFrame() -> CGRect {
        return CGRect(x: bounds.width - buttonWidth,
                      y: bounds.height / 2 - buttonHeight / 2,
                      width: buttonWidth,
                      height: buttonHeight)
    }
}
