//
//  Error.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 20/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import Foundation

extension Error {
    
    var description: String {
        if let localizedError = self as? LocalizedError {
            return localizedError.localizedDescription
        } else {
            return "\(self)"
        }
    }
    
}
