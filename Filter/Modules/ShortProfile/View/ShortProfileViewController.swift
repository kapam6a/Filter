//
//  AgeSelectionViewController.swift
//  Filter
//
//  Created by admin5 on 07.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol ShortProfileViewInput {
    func update(withCellModels cellModels: [BasicTableViewCellModel])
}

protocol ShortProfileViewOutput: class {
    func viewDidLoad()
    func viewDidTapChatButton()
    func viewDidTapFavoriteButton()
    func viewDidTapRouteButton()
    func viewDidTapOnMapButton()
    func viewDidTapFacebookButton()
    func viewDidTapInstagramButton()
    func viewDidTapThreeDotsButton()
}

class ShortProfileViewController:UIViewController, ShortProfileViewInput {
    weak var output: ShortProfileViewOutput!
    
    private let tableView: UITableView
    private let dataDisplayManager: ShortProfileDisplayManager
    
    init() {
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        
        dataDisplayManager = ShortProfileDisplayManager()
        
        super.init(nibName: nil, bundle: nil)
        
        tableView.bounces = false
        tableView.backgroundColor = .clear
        dataDisplayManager.register(in: tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK : Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = DesignBook.Colors.avtBlueBlue
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        view.addSubview(tableView)
        
        output.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let layout = Layout(bounds: view.bounds)
        tableView.frame = layout.tableViewFrame()
    }
    
    //MARK : ShortProfileViewInput
    
    func update(withCellModels cellModels: [BasicTableViewCellModel]) {
        dataDisplayManager.setup(withCellModels: cellModels)
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    private let inset = DesignBook.Insets.tableViewCellInset
    
    func tableViewFrame() -> CGRect {
        return CGRect(x: inset.left,
                      y: 0,
                      width: bounds.width - inset.left - inset.right,
                      height: bounds.height)
    }
}
