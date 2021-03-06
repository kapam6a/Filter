//
//  File.swift
//  Filter
//
//  Created by admin5 on 14.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class ShortProfileCellModelsConverter {
    private weak var viewOutput: ShortProfileViewOutput!
    
    init(withViewOutput viewOutput: ShortProfileViewOutput) {
        self.viewOutput = viewOutput
    }
    
    func convertModels(with user: UserEntity) -> [BasicTableViewCellModel]{
        var cellModels: [BasicTableViewCellModel] = []
        
        let statusCellModel = StatusCellModel(photoPath: user.photoURLPath,
                                              status: user.status,
                                              name: user.firstName) {
                                                    self.viewOutput.viewDidTapChatButton()
                                              }
        cellModels.append(statusCellModel)
        
        let professionCellModel = CareerCellModel(age: user.age,
                                                  career: user.work)
        cellModels.append(professionCellModel)
        
        let navigationCellModel = NavigationCellModel(favoriteButtonAction: { [unowned self] in
                                                        self.viewOutput.viewDidTapFavoriteButton()
                                                    }, routeButtonAction: { [unowned self] in
                                                        self.viewOutput.viewDidTapRouteButton()
                                                    }, onMapButtonAction: { [unowned self] in
                                                        self.viewOutput.viewDidTapOnMapButton()
                                                    })
        cellModels.append(navigationCellModel)
        
        let socialNetworkCellModel = SocialNetworkCellModel(facebookButtonAction: { [unowned self] in
                                                               self.viewOutput.viewDidTapFacebookButton()
                                                           }, instagramButtonAction: { [unowned self] in
                                                               self.viewOutput.viewDidTapInstagramButton()
                                                           }, threeDotsButtonAction: { [unowned self] in
                                                               self.viewOutput.viewDidTapThreeDotsButton()
                                                           })
        cellModels.append(socialNetworkCellModel)
    
        return cellModels
    }
}
