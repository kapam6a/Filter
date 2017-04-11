//
//  File.swift
//  Filter
//
//  Created by admin5 on 13.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let cellIdentifier = "PhotosCollectionViewCell"
}

struct PhotosCellModel: BasicCollectionViewCellModel {
    var cellClass: AnyClass {
        return PhotosCollectionViewCell.self
    }
    var cellIdentifier: String {
        return Constants.cellIdentifier
    }
    let path: String
    let title: String
}

class PhotosCollectionViewCell: UICollectionViewCell, BasicCollectionViewCell {
    private let photoImageView: UIImageView
    private let plusImageView: UIImageView
    private let titleLabel: UILabel
    
    override init(frame: CGRect) {
        plusImageView = UIImageView(frame: .zero)
        titleLabel = UILabel(frame: .zero)
        photoImageView = UIImageView(frame: .zero)
        
        super.init(frame: frame)
        
        plusImageView.image = #imageLiteral(resourceName: "plus_icon")
        contentView.addSubview(plusImageView)
        
        titleLabel.font = DesignBook.Fonts.avtTextStyle1
        titleLabel.textColor = DesignBook.Colors.avtDarkSkyBlue
        contentView.addSubview(titleLabel)
        
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.layer.cornerRadius = 4
        photoImageView.clipsToBounds = true
        photoImageView.layer.borderWidth = 1
        photoImageView.layer.borderColor = DesignBook.Colors.avtDarkSkyBlue.cgColor
        contentView.addSubview(photoImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = Layout(bounds: contentView.bounds)
        plusImageView.frame = layout.plusImageViewFrame()
        titleLabel.frame = layout.titleLabelFrame()
        photoImageView.frame = layout.photoImageViewFrame()
    }
    
    //MARK : PhotosCell
    
    func configure(withCellModel cellModel: BasicCollectionViewCellModel) {
        let model = cellModel as! PhotosCellModel
        photoImageView.image = UIImage(contentsOfFile: model.path)
        titleLabel.text = model.title
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    func plusImageViewFrame() -> CGRect {
        return CGRect(x: bounds.width / 2 - 18 / 2,
                      y: bounds.height / 2 - 18 / 2,
                      width: 18,
                      height: 18)
    }
    
    func titleLabelFrame() -> CGRect {
        return CGRect(x: bounds.width / 2 - 50 / 2,
                      y: plusImageViewFrame().maxY + 5,
                      width: 50,
                      height: 11)
    }
    
    func photoImageViewFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: bounds.width,
                      height: bounds.height)
    }
}

