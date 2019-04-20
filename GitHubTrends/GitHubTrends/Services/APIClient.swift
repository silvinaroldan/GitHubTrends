//
//  APIClient.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 20/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import Alamofire
import SwiftyJSON

enum APIResult<T> {
    case success(T)
    case failure(AlertInfo)
}

class APIClient {
    
    static let shared = APIClient()
    
    func searchTrendingRepositories(completion: @escaping (APIResult<[Repository]>) -> Void) {
        
        let errorParser = ErrorParser<[Repository]>(defaultTitle: Constants.ErrorMessage.somethingWentWrong,
                                                    defaultMessage: Constants.ErrorMessage.search)
        let endpoint = Endpoint.searchTrendingRepositories()
        AlamofireNetworkService.shared.hit(endpoint, jsonParser: parseRepository, errorParser: errorParser, completion: completion)
    }
    
    // MARK: - Parsers
    
    func parseRepository(from json: JSON) throws -> [Repository] {
        return try parseDataArray(from: json, of: Repository.self, key: "items", using: .iso8601)
    }
    
    func parseDataDictionary<T: Decodable>(from json: JSON, of type: T.Type, key: String, using decoder: JSONDecoder = .default) throws -> T {
        return try T.from(json: json, using: decoder)
    }
    
    func parseDataArray<T: Decodable>(from json: JSON, of type: T.Type, key: String, using decoder: JSONDecoder = .default) throws -> [T] {
        
        guard let array = json[key].array else {
            throw Error.corruptedJSONStructure(json, key: key)
        }
        
        return try array.map { try T.from(json: $0, using: decoder) }
    }
    
    // MARK: - APIClient Error
    
    enum Error: LocalizedError {
        case corruptedJSONStructure(JSON, key: String)
        case decoding
        
        var errorDescription: String? {
            switch self {
            case .corruptedJSONStructure(let json, let key):
                return "Could not parse key '\(key)' from JSON structure \(json)"
            case .decoding:
                return "Decoding error"
            }
        }
    }
    
}
