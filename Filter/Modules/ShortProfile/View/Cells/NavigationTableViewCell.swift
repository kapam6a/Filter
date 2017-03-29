//
//  File.swift
//  Filter
//
//  Created by admin5 on 27.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//


import UIKit

fileprivate struct Constants {
    static let cellIdentifier      = "NavigationTableViewCell"
    static let favoriteButtonTitle = "ИЗБРАННОЕ"
    static let routeButtonTitle    = "МАРШРУТ"
    static let onMapButtonTitle    = "НА КАРТЕ"
}

struct NavigationCellModel: BasicTableViewCellModel {
    var cellClass: AnyClass {
        return NavigationTableViewCell.self
    }
    var cellIdentifier: String {
        return Constants.cellIdentifier
    }
    let favoriteButtonAction: () -> Void
    let routeButtonAction: () -> Void
    let onMapButtonAction: () -> Void
}

class NavigationTableViewCell: UITableViewCell, BasicTableViewCell {
    private let favoriteButton: UIButton
    private let routeButton: UIButton
    private let onMapButton: UIButton
    
    private var favoriteButtonAction: (() -> Void)!
    private var routeButtonAction: (() -> Void)!
    private var onMapButtonAction: (() -> Void)!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        favoriteButton = UIButton(type: .custom)
        routeButton = UIButton(type: .custom)
        onMapButton = UIButton(type: .custom)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        favoriteButton.setImage(#imageLiteral(resourceName: "star_icon"), for: .normal)
        favoriteButton.setTitle(Constants.favoriteButtonTitle, for: .normal)
        favoriteButton.setTitleColor(DesignBook.Colors.avtDarkSkyBlue, for: .normal)
        favoriteButton.titleLabel?.font = DesignBook.Fonts.avtTextStyle1
        favoriteButton.addTarget(self, action: #selector(didTapFavoriteButton), for: .touchUpInside)
        contentView.addSubview(favoriteButton)
        
        routeButton.setImage(#imageLiteral(resourceName: "route_icon"), for: .normal)
        routeButton.setTitle(Constants.routeButtonTitle, for: .normal)
        routeButton.setTitleColor(DesignBook.Colors.avtDarkSkyBlue, for: .normal)
        routeButton.titleLabel?.font = DesignBook.Fonts.avtTextStyle1
        routeButton.addTarget(self, action:#selector(didTapRouteButton), for: .touchUpInside)
        contentView.addSubview(routeButton)
        
        onMapButton.setImage(#imageLiteral(resourceName: "eye_icon"), for: .normal)
        onMapButton.setTitle(Constants.onMapButtonTitle, for: .normal)
        onMapButton.setTitleColor(DesignBook.Colors.avtDarkSkyBlue, for: .normal)
        onMapButton.titleLabel?.font = DesignBook.Fonts.avtTextStyle1
        onMapButton.addTarget(self, action:#selector(didTapOnMapButton), for: .touchUpInside)
        contentView.addSubview(onMapButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = Layout(bounds: contentView.bounds)
        favoriteButton.frame = layout.favoriteButtonFrame()
        routeButton.frame = layout.routeButtonFrame()
        onMapButton.frame = layout.onMapButtonFrame()
    }
    
    //MARK : BasicTableViewCell
    
    func configure(withCellModel cellModel: BasicTableViewCellModel) {
        let model = cellModel as! NavigationCellModel
        favoriteButtonAction = model.favoriteButtonAction
        routeButtonAction = model.routeButtonAction
        onMapButtonAction = model.onMapButtonAction
    }
    
    //MARK : Action methods
    
    func didTapFavoriteButton(_ sender: UIButton) {
        favoriteButtonAction()
    }
    
    func didTapRouteButton(_ sender: UIButton) {
        routeButtonAction()
    }
    
    func didTapOnMapButton(_ sender: UIButton) {
        onMapButtonAction()
    }
}


fileprivate struct Layout {
    let bounds: CGRect
    
    private let buttonWidth: CGFloat  = 80
    private let buttonHeight: CGFloat = 16
    
    private let offset: CGFloat = 0
    
    func favoriteButtonFrame() -> CGRect {
        return CGRect(x: offset,
                      y: bounds.height / 2 - buttonHeight / 2,
                      width: buttonWidth,
                      height: buttonHeight)
    }
    
    func routeButtonFrame() -> CGRect {
        return CGRect(x: bounds.width / 2 - buttonWidth / 2,
                      y: bounds.height / 2 - buttonHeight / 2,
                      width: buttonWidth,
                      height: buttonHeight)
    }
    
    func onMapButtonFrame() -> CGRect {
        return CGRect(x: bounds.width - buttonWidth - offset,
                      y: bounds.height / 2 - buttonHeight / 2,
                      width: buttonWidth,
                      height: buttonHeight)
    }
}

