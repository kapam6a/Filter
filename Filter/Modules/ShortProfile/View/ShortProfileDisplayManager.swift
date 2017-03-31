//
//  File.swift
//  Filter
//
//  Created by admin5 on 13.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class ShortProfileDisplayManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    private var cellModels: [BasicTableViewCellModel]
    private weak var tableView: UITableView!
    
    override init() {
        cellModels = []
    }
    
    func register(in tableView: UITableView) {
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func setup(withCellModels cellModels: [BasicTableViewCellModel]) {
        self.cellModels = cellModels
        self.cellModels.forEach({ cellModel in
            tableView.register(cellModel.cellClass, forCellReuseIdentifier: cellModel.cellIdentifier)
        })
        tableView.reloadData()
    }
    
    //MARK : UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = cellModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier, for: indexPath) as! BasicTableViewCell
        cell.configure(withCellModel: model)
        return cell as! UITableViewCell
    }
    
    //MARK : UITableViewDelegate
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height:CGFloat = 44
        if indexPath.row == 0 {
            height = 66
        }
        return height
    }
}


