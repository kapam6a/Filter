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
}

protocol FilterCell {
    func configure(withCellModel cellModel: FilterCellModel)
}

struct FilterSectionModel{
    let cellModels: [FilterCellModel]
    let footerTitle: String
    let headerTitle :String
}

class FilterDataDisplayManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    private var sectionModels: [FilterSectionModel]!
    private weak var tableView: UITableView!
        
    func register(in tableView: UITableView) {
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func setup(withSectionModels sectionModels: [FilterSectionModel]) {
        self.sectionModels = sectionModels
        for sectionModel in sectionModels {
            for cellModel in sectionModel.cellModels {
                tableView.register(cellModel.cellClass, forCellReuseIdentifier: cellModel.cellIdentifier)
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionModels[section].cellModels.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
        cell.contentView.frame = CGRect(x: 15, y: 0, width: cell.contentView.frame.width - 15 * 2, height: cell.contentView.frame.height )
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = DesignBook.Fonts.avtTextStyle1
        header.textLabel?.textColor = DesignBook.Colors.avtBluish
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionModels[section].headerTitle
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        let footer = view as! UITableViewHeaderFooterView
        footer.textLabel?.font = DesignBook.Fonts.avtTextStyle1
        footer.textLabel?.textColor = DesignBook.Colors.avtBluish
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return sectionModels[section].footerTitle
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = sectionModels[indexPath.section].cellModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.cellIdentifier) as! FilterCell
        cell.configure(withCellModel: cellModel)
        return cell as! UITableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height: CGFloat = 44
        return height
    }
}
