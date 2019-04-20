//
//  ErrorParser.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 20/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import Foundation

class ErrorParser<T> {
    
    let defaultTitle: String
    let defaultMessage: String
    let unauthorizedClosure: AlertInfoClosure
    
    typealias AlertInfoClosure = ((AlertInfo) -> Void)
    
    init(defaultTitle: String, defaultMessage: String, whenUnauthorized unauthorizedClosure: @escaping AlertInfoClosure = defaultUnauthorizedClosure()) {
        self.defaultTitle = defaultTitle
        self.defaultMessage = defaultMessage
        self.unauthorizedClosure = unauthorizedClosure
    }
    
    func parse(_ error: Error) -> APIResult<T> {
        switch error {
            
        case let networkError as AlamofireNetworkService.Error:
            
            switch networkError {
            case .responseCorrupted(let response):
                guard let code = response.response?.statusCode else {
                    switch response.result {
                    case .success:
                        return defaultFailure(with: networkError)
                    case .failure(let error):
                        switch error {
                        case let nsError as NSError where nsError.code == -1009:
                            let message = defaultMessage + Constants.ErrorParse.offline
                            let info = AlertInfo(title: defaultTitle, message: message)
                            return .failure(info)
                        default:
                            return defaultFailure(with: networkError)
                        }
                    }
                }
                switch code {
                case 401:
                    let info = AlertInfo(title: "Oops", message: Constants.ErrorParse.sessionExpired, error: networkError)
                    unauthorizedClosure(info)
                    return .failure(info)
                default:
                    return defaultFailure(with: networkError)
                }
            case .unsuccessful(let code, let message):
                switch code {
                case 401:
                    let info = AlertInfo(title: defaultTitle, message: message, error: networkError)
                    unauthorizedClosure(info)
                    return .failure(info)
                case 422:
                    let info = AlertInfo(title: defaultTitle, message: defaultMessage + "\n" + message, error: networkError)
                    return .failure(info)
                    
                default:
                    return defaultFailure(with: networkError)
                }
            }
            
        default:
            return defaultFailure(with: error)
        }
        
    }
    
    // MARK: - Private
    
    private func defaultFailure(with error: Error) -> APIResult<T> {
        let info = AlertInfo(title: defaultTitle,
                             message: defaultMessage,
                             error: error)
        return .failure(info)
    }
    
    private static func defaultUnauthorizedClosure() -> ((AlertInfo) -> Void) {
        return { _ in
            
        }
    }
    
}
