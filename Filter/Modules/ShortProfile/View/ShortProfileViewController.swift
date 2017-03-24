//
//  AgeSelectionViewController.swift
//  Filter
//
//  Created by admin5 on 07.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol ShortProfileViewInput {
}

protocol ShortProfileViewOutput: class {
    func viewDidLoad()
}

class ShortProfileViewController:UIViewController, ShortProfileViewInput {
    weak var output: ShortProfileViewOutput!
    
    private let tableView: UITableView
    private let dataDisplayManager: ShortProfileDisplayManager
    
    init() {
        tableView = UITableView(frame: .zero)
        dataDisplayManager = ShortProfileDisplayManager()
        
        super.init(nibName: nil, bundle: nil)
        
        tableView.backgroundColor = .clear
        dataDisplayManager.register(in: tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK : Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = DesignBook.Colors.avtBackgroundColor
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
    
    func tableViewFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: bounds.width,
                      height: bounds.height)
    }
}
