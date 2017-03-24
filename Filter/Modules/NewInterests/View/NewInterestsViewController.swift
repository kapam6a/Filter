//
//  AgeSelectionViewController.swift
//  Filter
//
//  Created by admin5 on 07.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol NewInterestsViewInput {
    func update(withCellModels cellModels: [BasicTableViewCellModel])
}

protocol NewInterestsViewOutput: class {
    func viewDidLoad()
    func viewDidTapPlusButton(withTitle title: String)
    func viewDidChange(searchText: String)
    func viewDidTapCloseButton()
}

class NewInterestsViewController:ViewController, NewInterestsViewInput, TextFieldWithButtonDelegate {
    weak var output: NewInterestsViewOutput!
    
    private let tableView: UITableView
    private let dataDisplayManager: NewInterestsDataDisplayManager
    private let headerView: TextFieldWithButton
    
    init() {
        tableView = UITableView(frame: .zero, style: .grouped)
        dataDisplayManager = NewInterestsDataDisplayManager()
        headerView = TextFieldWithButton(frame: .zero, showLoupe: true)

        super.init(nibName: nil, bundle: nil)
        
        tableView.backgroundColor = .clear
        tableView.bounces = false

        dataDisplayManager.register(in: tableView)
        
        headerView.buttonTitle = "ОК"
        headerView.placeHolder = "Поиск по интересам"
        headerView.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK : Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        container.addSubview(tableView)
        container.addSubview(headerView)
        output.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let layout = Layout(bounds: container.bounds)
        tableView.frame = layout.tableViewFrame()
        tableView.contentInset = layout.tableViewContentInset()
        tableView.sizeToFit()
        adjustContainerSize(withSize: tableView.frame.size)
        
        headerView.frame = layout.headerViewFrame()
    }
    
    //MARK : NewInterestsViewInput
    
    func update(withCellModels cellModels: [BasicTableViewCellModel]) {
        dataDisplayManager.setup(withCellModels: cellModels)
        tableView.reloadData()
        tableView.sizeToFit()
        adjustContainerSize(withSize: tableView.frame.size)
    }
    
    //MARK : TextFieldWithButtonDelegate
    
    func textFieldWithButtonDidTapButton(_ textFieldWithButton: TextFieldWithButton) {

    }
    
    func textFieldWithButtonDidTapClearButton(_ textFieldWithButton: TextFieldWithButton) {
        
    }
    
    func textFieldWithButton(_ textFieldWithButton: TextFieldWithButton, textDidChange text: String) {
        output.viewDidChange(searchText: text)
    }

}

fileprivate struct Layout {
    let bounds: CGRect
    private let headerHeight: CGFloat = 44
    
    func tableViewFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: bounds.width ,
                      height: bounds.height)
    }
    
    func tableViewContentInset() -> UIEdgeInsets {
        return UIEdgeInsets(top: 0,
                            left: 0,
                            bottom: 0,
                            right: 0)
    }
    
    func headerViewFrame() -> CGRect {
        return CGRect(x: 15,
                      y: 0,
                      width: bounds.width - 15 * 2,
                      height: headerHeight)
    }
}
