//
//  AgeSelectionViewController.swift
//  Filter
//
//  Created by admin5 on 07.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol PhotosViewInput {
    func update(withCellModels cellModels: [PhotosCellModel])
}

protocol PhotosViewOutput: class {
    func viewDidLoad()
    func viewDidTapCloseButton()
}

class PhotosViewController:UIViewController, PhotosViewInput {
    weak var output: PhotosViewOutput!
    
    private let collectionView: UICollectionView
    private let dataDisplayManager: PhotosDataDisplayManager
    private let closeButton: UIButton
    
    init() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: PhotosCollectionViewFlowLayout())
        dataDisplayManager = PhotosDataDisplayManager()
        closeButton = UIButton(type: .custom)
        
        super.init(nibName: nil, bundle: nil)
        
        collectionView.backgroundColor = .clear
        dataDisplayManager.register(in: collectionView)
        closeButton.setImage(#imageLiteral(resourceName: "close_icon"), for: .normal)
        closeButton.addTarget(self,
                              action: #selector(didTapCloseButton),
                              for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK : Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = DesignBook.Colors.avtBackgroundColor
        view.addSubview(collectionView)
        view.addSubview(closeButton)
        
        output.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let layout = Layout(bounds: view.bounds)
        collectionView.frame = layout.collectionViewFrame()
        closeButton.frame = layout.closeButtonFrame()
    }
    
    //MARK : PhotosViewInput
    
    func update(withCellModels cellModels: [PhotosCellModel]) {
        dataDisplayManager.setup(withCellModels: cellModels)
    }
    
    //MARK : Action methods
    
    func didTapCloseButton(_ sender: UIButton) {
        output.viewDidTapCloseButton()
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    func collectionViewFrame() -> CGRect {
        return CGRect(x: 15,
                      y: 84,
                      width: bounds.width - 15 * 2,
                      height: bounds.height - 84 - 15)
    }
    
    func closeButtonFrame() -> CGRect {
        return CGRect(x: bounds.width - 30,
                      y: 30,
                      width: 30,
                      height: 30)
    }
}
