//
//  File.swift
//  Filter
//
//  Created by admin5 on 23.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let cellIdentifier = "ProfessionTableViewCell"
}

struct SocialNetworkCellModel: BasicTableViewCellModel {
    var cellClass: AnyClass {
        return StatusTableViewCell.self
    }
    var cellIdentifier: String {
        return Constants.cellIdentifier
    }
}

class SocialNetworkTableViewCell: UITableViewCell, BasicTableViewCell {
    private let facebookButton: UIButton
    private let instagramButton: UIButton
    private let threeDotsButton: UIButton
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        facebookButton = UIButton(type: .custom)
        instagramButton = UIButton(type: .custom)
        threeDotsButton = UIButton(type: .custom)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        facebookButton.setImage(#imageLiteral(resourceName: "facebook_logo_icon"), for: .normal)
        facebookButton.addTarget(self, action: #selector(didTapFacebookButton), for: .touchUpInside)
        contentView.addSubview(facebookButton)
        
        instagramButton.setImage(#imageLiteral(resourceName: "instagram_logo_icon"), for: .normal)
        instagramButton.addTarget(self, action:#selector(didTapInstagramButton), for: .touchUpInside)
        contentView.addSubview(instagramButton)
        
        threeDotsButton.setImage(#imageLiteral(resourceName: "facebook_logo_icon"), for: .normal)
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
        let model = cellModel as! StatusCellModel
    }
    
    //MARK : Action methods
    
    func didTapFacebookButton() {
        
    }
    
    func didTapInstagramButton() {
        
    }
    
    func didTapThreeDotsButton() {
        
    }
}


fileprivate struct Layout {
    let bounds: CGRect
    
    func facebookButtonFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: bounds.width,
                      height: bounds.height)
    }
    
    func instagramButtonFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: bounds.width,
                      height: bounds.height)
    }
    
    func threeDotsButtonFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: bounds.width,
                      height: bounds.height)
    }
}
