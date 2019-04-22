//
//  APIClient+Repositories.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 21/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import Alamofire
import SwiftyJSON

extension APIClient {
    
    func getTrendingRepositories(completion: @escaping (APIResult<[Repository]>) -> Void) {
        
        let errorParser = ErrorParser<[Repository]>(defaultTitle: Constants.ErrorMessage.somethingWentWrong,
                                                    defaultMessage: Constants.ErrorMessage.search)
        let endpoint = Endpoint.getTrendingRepositories()
        AlamofireNetworkService.shared.hit(endpoint, jsonParser: parseRepository, errorParser: errorParser, completion: completion)
    }
    
    func getReadmeFile(repository: String, completion: @escaping (APIResult<Readme>) -> Void) {
        
        let endpoint = Endpoint.getReadmeFile(from: repository)
        let errorParser = ErrorParser<Readme>(defaultTitle: Constants.ErrorMessage.somethingWentWrong,
                                              defaultMessage: Constants.ErrorMessage.readme)
        AlamofireNetworkService.shared.hit(endpoint, jsonParser: parseReadme, errorParser: errorParser, completion: completion)
    }
    
    func getRawReadmeFile(from readme: Readme, completion: @escaping (APIResult<String>) -> Void) {
        let endpoint = Endpoint.getRawReadmeFile(from: readme)
        let errorParser = ErrorParser<String>(defaultTitle: Constants.ErrorMessage.somethingWentWrong,
                                              defaultMessage: Constants.ErrorMessage.readme)
        
        AlamofireNetworkService.shared.responseString(endpoint, errorParser: errorParser, completion: completion)
    }
    
    // MARK: - Parsers
    
    func parseRepository(from json: JSON) throws -> [Repository] {
        return try parseDataArray(from: json, of: Repository.self, key: "items")
    }
    
    func parseReadme(from json: JSON) throws -> Readme {
        return try parseDataDictionary(from: json, of: Readme.self)
    }
}
