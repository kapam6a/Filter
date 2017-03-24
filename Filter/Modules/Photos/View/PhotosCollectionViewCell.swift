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

struct PhotosCellModelImpl: PhotosCellModel {
    var cellClass: AnyClass {
        return PhotosCollectionViewCell.self
    }
    var cellIdentifier: String {
        return Constants.cellIdentifier
    }
    let path: String
}

class PhotosCollectionViewCell: UICollectionViewCell, PhotosCell {
    private let imageView: UIImageView
    
    override init(frame: CGRect) {
        imageView = UIImageView(frame: .zero)
        
        super.init(frame: frame)
        
        layer.cornerRadius = 4
        layer.borderColor = DesignBook.Colors.avtDarkSkyBlue.cgColor
        layer.borderWidth = 1
        
        clipsToBounds = true
        
        contentView.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = Layout(bounds: contentView.bounds)
        imageView.frame = layout.imageViewFrame()
    }
    
    //MARK : PhotosCell
    
    func configure(withCellModel cellModel: PhotosCellModel) {
        let model = cellModel as! PhotosCellModelImpl
        imageView.image = UIImage(contentsOfFile: model.path)
    }
    
    //MARK : Static methods 
    
   static func size(withModel model: PhotosCellModel) -> CGSize {
        let photosCellModelImpl = model as! PhotosCellModelImpl
        let path = photosCellModelImpl.path
        let photo = UIImage(contentsOfFile: path)
        return CGSize(width:photo!.size.width,
                      height: photo!.size.height)
    }
}


fileprivate struct Layout {
    let bounds: CGRect
    
    func imageViewFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: bounds.width,
                      height: bounds.height)
    }
}

