//
//  NetworkClient.swift
//  Filter
//
//  Created by admin5 on 29.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

protocol NetworkClient {
    func sendRequest(successful: @escaping(Data) -> Void, failed: @escaping(Error) -> Void)
}

class NetworkClientImplementation: NetworkClient {
    private let urlSession: URLSession
    private let request: URLRequest
    
    init(with request: URLRequest) {
        urlSession = URLSession.shared
        self.request = request
    }
    
    //MARK : NetworkClient
    
    func sendRequest(successful: @escaping(Data) -> Void, failed: @escaping(Error) -> Void) {
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            if let data = data {
                successful(data)
            }
            if let error = error {
                failed(error)
            }
        }
        dataTask.resume()
    }
}
