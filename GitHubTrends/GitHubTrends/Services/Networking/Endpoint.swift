//
//  Endpoint.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 20/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import Alamofire
import Foundation

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
    static func getTrendingRepositories() -> Endpoint {
        let daysBefore = Calendar.current.date(byAdding: .day, value: -7, to: Date())
        let stringDaysBefore = DateFormatter.reverseDashed.string(from: daysBefore!)
        let urlPath = String(format: Constants.API.getTrendingRepositories, stringDaysBefore)
        return Endpoint(method: .get,
                        path: urlPath)
    }

    static func getReadmeFile(from repository: String) -> Endpoint {
        let urlPath = String(format: Constants.API.getReadmeFile, "\(repository)")
        return Endpoint(method: .get,
                        path: urlPath)
    }

    static func getRawReadmeFile(from readme: Readme) -> Endpoint {
        return Endpoint(method: .get,
                        path: readme.downloadURL)
    }
}
