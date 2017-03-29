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
    let photoPath: String
    let status: String
    let name: String
    let chatButtonAction: () -> Void
}

class StatusTableViewCell: UITableViewCell, BasicTableViewCell {
    private let container: UIView

    private let photoImageView: UIImageView
    private let statusLabel: UILabel
    private let emojiImageView: UIImageView
    private let nameLabel: UILabel
    private let chatButton: UIButton
    
    private var chatButtonAction: (() -> Void)!

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        container = UIView(frame: .zero)
        
        photoImageView = UIImageView(frame: .zero)
        statusLabel = UILabel(frame: .zero)
        emojiImageView = UIImageView(frame: .zero)
        nameLabel = UILabel(frame: .zero)
        chatButton = UIButton(type: .custom)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(container)
        
        photoImageView.layer.borderColor = DesignBook.Colors.avtDarkSkyBlue.cgColor
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.layer.borderWidth = 1
        photoImageView.layer.cornerRadius = 4
        photoImageView.clipsToBounds = true
        container.addSubview(photoImageView)

        statusLabel.textColor = DesignBook.Colors.avtWhite
        statusLabel.font = DesignBook.Fonts.avtTextStyle7
        statusLabel.numberOfLines = 0
        statusLabel.lineBreakMode = .byWordWrapping        
        container.addSubview(statusLabel)
        
        container.addSubview(emojiImageView)

        nameLabel.textColor = DesignBook.Colors.avtWhite
        nameLabel.font = DesignBook.Fonts.avtTextStyle4
        container.addSubview(nameLabel)
        
        chatButton.setImage(#imageLiteral(resourceName: "chat_icon"), for: .normal)
        chatButton.addTarget(self, action: #selector(didTapChatButton), for: .touchUpInside)
        container.addSubview(chatButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = Layout(bounds: contentView.bounds)
        container.frame = layout.containerFrame()
        photoImageView.frame = layout.photoImageViewFrame()
        nameLabel.frame = layout.nameLabelFrame()
        nameLabel.frame.size = nameLabel.sizeThatFits(.zero)
        emojiImageView.frame = layout.emojiImageViewFrame()
        statusLabel.frame = layout.statusLabelFrame()
        chatButton.frame = layout.chatButtonFrame()
    }
    
    //MARK : BasicTableViewCell
    
    func configure(withCellModel cellModel: BasicTableViewCellModel) {
        let model = cellModel as! StatusCellModel
        photoImageView.image = UIImage(contentsOfFile: model.photoPath)
        statusLabel.text = model.status
        nameLabel.text = model.name
        chatButtonAction = model.chatButtonAction
    }
    
    //MARK : Action methods
    
    func didTapChatButton() {
        chatButtonAction()
    }

}


fileprivate struct Layout {
    let bounds: CGRect
    
    private let photoImageViewWidth: CGFloat = 32
    private let photoImageViewHeight: CGFloat = 42
    
    private let emojiimageViewWidth: CGFloat = 21
    private let emojiImageViewHeight: CGFloat = 23
    
    private let chatButtonWidth: CGFloat = 22
    private let chatButtonHeight: CGFloat = 22
    
    private let offset: CGFloat = 15
    private let interItemSpacing: CGFloat = 5

    
    func containerFrame() -> CGRect {
        return CGRect(x: 0,
                      y: bounds.height / 2 - photoImageViewHeight / 2,
                      width: bounds.width,
                      height: photoImageViewHeight)
    }
    
    func photoImageViewFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: photoImageViewWidth,
                      height: photoImageViewHeight)
    }
    
    func statusLabelFrame() -> CGRect {
        return CGRect(x: emojiImageViewFrame().maxX + interItemSpacing,
                      y: emojiImageViewFrame().minY,
                      width: 120,
                      height: 28)
    }
    
    func emojiImageViewFrame() -> CGRect {
        return CGRect(x: photoImageViewWidth + offset,
                      y: photoImageViewHeight - emojiImageViewHeight,
                      width: emojiimageViewWidth,
                      height: emojiImageViewHeight)
    }

    func nameLabelFrame() -> CGRect {
        return CGRect(x: photoImageViewWidth + offset,
                      y: 0,
                      width: 0,
                      height: 0)
    }

    func chatButtonFrame() -> CGRect {
        return CGRect(x: containerFrame().width - chatButtonWidth,
                      y: containerFrame().height / 2 - chatButtonHeight / 2,
                      width: chatButtonWidth,
                      height: chatButtonHeight)
    }

}

