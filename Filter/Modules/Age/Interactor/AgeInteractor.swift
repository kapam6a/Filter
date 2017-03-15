//
//  File.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

protocol AgeInteractorInput {
  
}

protocol AgeInteractorOutput:class {
    
}

class AgeInteractor: AgeInteractorInput {
    weak var output: AgeInteractorOutput!
}
