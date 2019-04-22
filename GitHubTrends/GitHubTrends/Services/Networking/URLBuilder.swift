//
//  URLBuilder.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 20/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import Foundation

class URLBuilder {
    
    static var `default` = URLBuilder(baseURL: URL(string: Settings.shared.apiBaseURL)!)
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    let baseURL: URL
    
    func url(for endpoint: Endpoint) throws -> URL {
        enum Error: Swift.Error {
            case couldNotRemovePercentEncoding
        }
        let encodedURL = baseURL.appendingPathComponent(endpoint.path.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
        
        guard
            let string = encodedURL.absoluteString.removingPercentEncoding,
            let decodedURL = URL(string: string)
        else { throw Error.couldNotRemovePercentEncoding }
        return decodedURL
    }
    
}
