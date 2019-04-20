//
//  JSONDecoder.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 20/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import Foundation

extension JSONDecoder {
    
    static var `default`: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.slashed)
        return decoder
    }
    
    static var reverseDashedDates: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.reverseDashed)
        return decoder
    }
    
    static var iso8601: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.iso8601)
        return decoder
    }
    
}
