//
//  AgeSelectionViewController.swift
//  Filter
//
//  Created by admin5 on 07.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol AgeSelectionViewInput {
    func update(withValue initialValue: Int)
}

protocol AgeSelectionViewOutput: class {
    func viewDidLoad()
}

class AgeSelectionViewController:UIViewController, AgeSelectionViewInput {
    weak var output: AgeSelectionViewOutput!
    
    private let ageScaleView: ValueScaleView
    
    init() {
        ageScaleView = ValueScaleView(frame: .zero)
        
        super.init(nibName: nil, bundle: nil)
        
        ageScaleView.backgroundColor = DesignBook.Colors.background
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(ageScaleView)
        
        output.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let layout = Layout(bounds: view.bounds)
        ageScaleView.frame = layout.ageScaleViewFrame()
    }
    
    //MARK : AgeSelectionViewInput
    
    func update(withValue initialValue: Int) {
        ageScaleView.value = initialValue
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    func ageScaleViewFrame() -> CGRect {
        return bounds
    }
}
