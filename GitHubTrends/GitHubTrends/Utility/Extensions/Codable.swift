//
//  Codable.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 20/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import SwiftyJSON

// MARK: - Decoding (JSON → Entity)

struct DecodingError<T>: LocalizedError {
    let type: T.Type
    let json: JSON
    let error: Swift.Error

    var errorDescription: String? {
        return "Could not convert JSON to entity of type \(self.type)\n\nError: \(self.error)\n\nJSON:\(self.json)"
    }
}

extension Decodable {

    static func from(json: JSON, using decoder: JSONDecoder = .default) throws -> Self {
        do {
            let dictionary = json.dictionaryObject ?? [:]
            let data = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
            return try decoder.decode(self, from: data)
        } catch {
            throw DecodingError(type: self, json: json, error: error)
        }
    }

}
