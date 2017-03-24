//
//  File.swift
//  Filter
//
//  Created by admin5 on 13.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let cellIdentifier = "StatusTableViewCell"
}

struct StatusCellModel: BasicTableViewCellModel {
    var cellClass: AnyClass {
        return StatusTableViewCell.self
    }
    var cellIdentifier: String {
        return Constants.cellIdentifier
    }
}

class StatusTableViewCell: UITableViewCell, BasicTableViewCell {
    private let photoImageView: UIImageView
    private let statusLabel: UILabel
    private let emojiImageView: UIImageView
    private let nameLabel: UILabel
    private let chatButton: UIButton
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        photoImageView = UIImageView(frame: .zero)
        statusLabel = UILabel(frame: .zero)
        emojiImageView = UIImageView(frame: .zero)
        nameLabel = UILabel(frame: .zero)
        chatButton = UIButton(type: .custom)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        photoImageView.layer.borderColor = DesignBook.Colors.avtDarkSkyBlue.cgColor
        photoImageView.layer.borderWidth = 1
        photoImageView.layer.cornerRadius = 4
        photoImageView.clipsToBounds = true
        contentView.addSubview(photoImageView)

        statusLabel.textColor = DesignBook.Colors.avtWhite
        statusLabel.font = DesignBook.Fonts.avtTextStyle7
        statusLabel.numberOfLines = 3
        contentView.addSubview(statusLabel)
        
        contentView.addSubview(emojiImageView)

        nameLabel.textColor = DesignBook.Colors.avtWhite
        nameLabel.font = DesignBook.Fonts.avtTextStyle4
        contentView.addSubview(nameLabel)
        
        chatButton.setImage(#imageLiteral(resourceName: "chat_icon"), for: .normal)
        chatButton.addTarget(self, action: #selector(didTapChatButton), for: .touchUpInside)
        contentView.addSubview(chatButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = Layout(bounds: contentView.bounds)
        photoImageView.frame = layout.photoImageViewFrame()
        statusLabel.frame = layout.statusLabelFrame()
        emojiImageView.frame = layout.emojiImageViewFrame()
        nameLabel.frame = layout.nameLabelFrame()
        chatButton.frame = layout.chatButtonFrame()
    }
    
    //MARK : BasicTableViewCell
    
    func configure(withCellModel cellModel: BasicTableViewCellModel) {
        let model = cellModel as! StatusCellModel
    }
    
    //MARK : Action methods
    
    func didTapChatButton() {
        
    }

}


fileprivate struct Layout {
    let bounds: CGRect
    
    private let photoImageViewWidth: CGFloat = 32
    private let photoImageViewHeight: CGFloat = 39
    
    private let offset:CGFloat = 15
    
    func photoImageViewFrame() -> CGRect {
        return CGRect(x: 0,
                      y: bounds.height / 2 - photoImageViewHeight / 2,
                      width: photoImageViewWidth,
                      height: photoImageViewWidth)
    }
    
    func statusLabelFrame() -> CGRect {
        return CGRect(x: photoImageViewFrame().maxX + offset,
                      y: 0,
                      width: bounds.width,
                      height: bounds.height)
    }
    
    func emojiImageViewFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: bounds.width,
                      height: bounds.height)
    }

    func nameLabelFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: bounds.width,
                      height: bounds.height)
    }

    func chatButtonFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: bounds.width,
                      height: bounds.height)
    }

}

