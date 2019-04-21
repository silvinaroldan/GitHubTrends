//
//  Endpoint.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 20/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import Foundation
import Alamofire

class Endpoint {
    
    let method: HTTPMethod
    let path: String
    let parameters: [String: Any]?
    
    init(method: HTTPMethod, path: String, parameters: [String: Any]? = nil) {
        self.method = method
        self.path = path
        self.parameters = parameters
    }
}

extension Endpoint {
    var parameterEncoding: ParameterEncoding {
        switch self.method {
        case .get: return URLEncoding.default
        default: return JSONEncoding.default
        }
    }
}

extension Endpoint {
    static func searchTrendingRepositories() -> Endpoint {
        let urlPath = String(format: Constants.API.searchTrendingRepositories)
        return Endpoint(method: .get,
                        path: urlPath)
    }
}