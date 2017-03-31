//
//  File.swift
//  Filter
//
//  Created by admin5 on 29.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

fileprivate let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEzOCwiaXNzIjoiaHR0cDpcL1wvNDYuMTAxLjE2LjM1XC9hcGlcL2F1dGhcL3JlZ2lzdGVyIiwiaWF0IjoxNDkwODY5ODMzLCJleHAiOjE0OTA4NzM0MzMsIm5iZiI6MTQ5MDg2OTgzMywianRpIjoiYTAwNjVhN2E0ODUxZmNmZWM4MTM2MjBhNGFmMDBkZWYifQ.8Ptz_BSKeOjUaNDLOt532NAF0TEBHuff2gX8iqAPz1Q"

class RequestFactory {
    static func userProfileRequest() -> URLRequest {
        let url = URL(string: "http://46.101.16.35/api/users/3")!
        var request = URLRequest(url: url)
        request.addValue("Bearer {\(token)}", forHTTPHeaderField: "Authorization")
        return request
    }
}
