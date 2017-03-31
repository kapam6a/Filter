//
//  FilterDataDisplayManager.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

struct FilterSectionModel{
    let cellModels: [BasicTableViewCellModel]
    let footerTitle: String
    let headerTitle :String
}

class FilterDataDisplayManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    private var sectionModels: [FilterSectionModel]
    private weak var tableView: UITableView!
    
    private var createdTableViewCells: [IndexPath : UITableViewCell]
    
    override init() {
        createdTableViewCells = [:]
        sectionModels = []
        
        super.init()
    }
    
    //MARK : Public
        
    func register(in tableView: UITableView) {
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func setup(withSectionModels sectionModels: [FilterSectionModel]) {
        self.sectionModels = sectionModels
        let cellModels: [BasicTableViewCellModel] = sectionModels.flatMap { $0.cellModels }
        cellModels.forEach { model in
            tableView.register(model.cellClass, forCellReuseIdentifier: model.cellIdentifier)
        }
        tableView.reloadData()
    }
    
    //MARK : UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionModels[section].cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = sectionModels[indexPath.section].cellModels[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.cellIdentifier) as! BasicTableViewCell
        cell.configure(withCellModel: cellModel)
        
        createdTableViewCells[indexPath] = cell as? UITableViewCell
        
        return cell as! UITableViewCell
    }
    
    //MARK : UITableViewDelegate
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
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
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = createdTableViewCells[indexPath]!
        let cellSize = cell.sizeThatFits(tableView.frame.size)
        
        return cellSize.height
    }
}


