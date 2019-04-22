//
//  AlamofireNetworkService.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 20/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import Alamofire
import SwiftyJSON

class AlamofireNetworkService {
    
    static let shared = AlamofireNetworkService()
    
    let sessionManager = SessionManager()
    let urlBuilder = URLBuilder.default
    
    /// Hits the given `endpoint`
    ///
    /// If everything goes fine, it gives control to the `jsonParser` block, passing the response JSON as parameter
    ///
    /// Once the `jsonParser` finished successfully, it gives control to the `completion` block, with the corresponding `APIResult`
    ///
    /// If any error is thrown at any instance, it gives control to the `errorParser`, calling the `parse` function with the given error. There, you have the chance of generating your own `APIResult` based on the thrown error
    /// - parameter endpoint: The endpoint to hit
    /// - parameter jsonParser: The block that is executed once a JSON is obtained
    /// - parameter errorParser: An object providing a `parse` method to convert any error that is thrown at any moment into an `APIResult`
    /// - parameter completion: The block that is executed after an APIResult is obtained, either from the `jsonParser` or from the `errorParser`
    func hit<T>(_ endpoint: Endpoint, jsonParser: @escaping (JSON) throws -> T, errorParser: ErrorParser<T>, completion: @escaping (APIResult<T>) -> Void) {
        do {
            let url = try urlBuilder.url(for: endpoint)
            let request = sessionManager.request(url, method: endpoint.method, parameters: endpoint.parameters, encoding: endpoint.parameterEncoding, headers: makeHeaders())
            request.responseJSON { response in
                do {
                    let json = try self.parseData(from: response)
                    let result = try jsonParser(json)
                    completion(.success(result))
                } catch {
                    completion(errorParser.parse(error))
                }
            }
        } catch {
            completion(errorParser.parse(error))
        }
    }
    
    func responseString(_ endpoint: Endpoint, errorParser: ErrorParser<String>, completion: @escaping (APIResult<String>) -> Void) {
        let url = URL(string: endpoint.path)!
        let request = sessionManager.request(url)
        request.responseString { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(errorParser.parse(error))
            }
        }
    }
    
    // MARK: - Error
    
    enum Error: Swift.Error {
        case responseCorrupted(DataResponse<Any>)
        case unsuccessful(code: Int, message: String)
        
        var localizedDescription: String {
            switch self {
            case .responseCorrupted(let response):
                return "Could not parse response: \(response)"
            case .unsuccessful(let code, let message):
                return "Response was unsuccessful\n\nCode: \(code)\nMessage:\(message)"
            }
        }
    }
    
}

internal extension AlamofireNetworkService {
    
    func makeHeaders() -> [String: String] {
        return ["Accept": "application/vnd.github.v3+json",
                "Content-Type": "application/json"]
    }
    
    func urlRequest(for endpoint: Endpoint) throws -> URLRequest {
        let url = try urlBuilder.url(for: endpoint)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        makeHeaders().forEach { request.addValue($1, forHTTPHeaderField: $0) }
        if let parameters = endpoint.parameters {
            request = try JSONEncoding.default.encode(request, with: parameters)
        }
        return request
    }
    
    func parseData(from response: DataResponse<Any>) throws -> JSON {
        
        if let dict = response.value as? [String: Any] {
            return JSON(dict)
        } else if let dictArray = response.value as? [[String: Any]] {
            return JSON(dictArray)
        } else {
            throw Error.responseCorrupted(response)
        }
    }
    
}
