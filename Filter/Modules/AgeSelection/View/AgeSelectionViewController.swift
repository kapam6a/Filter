//
//  AgeSelectionViewController.swift
//  Filter
//
//  Created by admin5 on 07.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol AgeSelectionViewInput {
    
}

protocol AgeSelectionViewOutput: class {
    
}

class AgeSelectionViewController:UIViewController, AgeSelectionViewInput {
    weak var output: AgeSelectionViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}
