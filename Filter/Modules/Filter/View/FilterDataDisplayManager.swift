//
//  FilterDataDisplayManager.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol FilterCellModel {
    var cellIdentifier: String { get }
    var cellClass: AnyClass { get }
    var footerTitle: String { get }
}

protocol FilterCell {
    func configure(withCellModel cellModel: FilterCellModel)
}

class FilterDataDisplayManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    private var cellModels: [FilterCellModel]!
    private weak var tableView: UITableView!
        
    func register(in tableView: UITableView) {
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func setup(withCellModels cellModels: [FilterCellModel]) {
        self.cellModels = cellModels
        for cellModel in cellModels {
            tableView.register(cellModel.cellClass, forCellReuseIdentifier: cellModel.cellIdentifier)
        }
        tableView.register(FilterTableViewFooter.self, forHeaderFooterViewReuseIdentifier: "footer")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = tableView.backgroundColor
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: "footer") as! FilterTableViewFooter
        footer.title = cellModels[section].footerTitle
        return footer
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = cellModels[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.cellIdentifier) as! FilterCell
        cell.configure(withCellModel: cellModel)
        return cell as! UITableViewCell
    }
}
