//
//  File.swift
//  Filter
//
//  Created by admin5 on 29.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

fileprivate let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEzNCwiaXNzIjoiaHR0cDpcL1wvNDYuMTAxLjE2LjM1XC9hcGlcL2F1dGhcL3JlZ2lzdGVyIiwiaWF0IjoxNDkwNzgyNTUzLCJleHAiOjE0OTA3ODYxNTMsIm5iZiI6MTQ5MDc4MjU1MywianRpIjoiMTkyN2ZmNzI0OTY0YTgyN2I3ZTAwYTRhYWQxZTEwZWUifQ.gasjyvRGb_Bllq7M2HjlXEIXjYrbiKzCLZgzuG6aLy8"

class RequestFactory {
    static func userProfileRequest() -> URLRequest {
        let url = URL(string: "http://46.101.16.35/api/users/3")!
        var request = URLRequest(url: url)
        request.addValue("Bearer {\(token)}", forHTTPHeaderField: "Authorization")
        return request
    }
}
