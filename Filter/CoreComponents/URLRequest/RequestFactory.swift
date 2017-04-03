//
//  File.swift
//  Filter
//
//  Created by admin5 on 03.04.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let mainURLPath = "http://46.101.16.35/api/"
    static let headerValue = "Bearer"
    static let headerField = "Authorization"
}

protocol RequestFactory {
    func userRequest(userId: Int, token: String) -> URLRequest
    func closeUsersRequest(latitude: Double, longitude: Double, token: String) -> URLRequest
    func updateLastCoordinateRequest(userId: Int, latitude: Double, longitude: Double, token: String) -> URLRequest
}

class RequestFactoryImplementation: RequestFactory {
    func userRequest(userId: Int,
                      token: String) -> URLRequest {
        let url = URL(string: Constants.mainURLPath + "users/\(userId)")!
        var request = URLRequest(url: url)
        request.addValue(Constants.headerValue + "{\(token)}", forHTTPHeaderField: Constants.headerField)
        return request
    }
    
    func closeUsersRequest(latitude: Double,
                          longitude: Double,
                              token: String) -> URLRequest {
        let url = URL(string: Constants.mainURLPath + "users/")!
        var request = URLRequest(url: url)
        request.addValue(Constants.headerValue + "{\(token)}", forHTTPHeaderField: Constants.headerField)
        return request
    }
    
    func updateLastCoordinateRequest(userId: Int,
                                   latitude: Double,
                                  longitude: Double,
                                      token: String) -> URLRequest {
        let uuid = UIDevice.current.identifierForVendor!.uuidString
        let deviceType = "iPhone 6"
        let url = URL(string: Constants.mainURLPath + "users/\(userId))/coordinates")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let body = "user_id=\(userId)&" +
            "lat=\(latitude)&" +
            "lon=\(longitude)&" +
            "date=\(Date())&" +
            "deviceType=\(deviceType)&" +
            "token=\(token)&" +
            "deviceID=\(uuid)"
        request.httpBody = body.data(using: .utf8)
        return request
    }
}
