//
//  NetworkClient.swift
//  Filter
//
//  Created by admin5 on 29.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

protocol NetworkClient {
    func sendRequest(request: URLRequest, successful: @escaping(Data) -> Void, failed: @escaping(Error) -> Void)
}

class NetworkClientImplementation: NetworkClient {
    private let urlSession: URLSession
    private let errorHandler: ErrorHandler
    
    init(errorHandler: ErrorHandler) {
        urlSession = URLSession.shared
        self.errorHandler = errorHandler
    }
    
    //MARK : NetworkClient
    
    func sendRequest(request: URLRequest, successful: @escaping(Data) -> Void, failed: @escaping(Error) -> Void) {
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    if let data = data {
                        DispatchQueue.main.async {
                            successful(data)
                        }
                    }
                } else {
                    let error = NSError(domain:"", code:httpResponse.statusCode, userInfo:nil)
                    DispatchQueue.main.async {
                        self.errorHandler.handle(error: error)
                        failed(error)
                    }
                }
            }
            if let error = error {
                DispatchQueue.main.async {
                    failed(error)
                }
            }
        }
        dataTask.resume()
    }
}
