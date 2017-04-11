//
//  ErrorHandler.swift
//  Filter
//
//  Created by admin5 on 10.04.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol ErrorHandler {
    func handle(error: NSError)
}

class ErrorHandlerImplementation: ErrorHandler {
    func handle(error: NSError) {
        if error.code == 401 {
            let appDelegate  = UIApplication.shared.delegate!
            let viewController = appDelegate.window!!.rootViewController
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
            viewController?.present(vc, animated: true, completion: nil)
        }
    }
}
