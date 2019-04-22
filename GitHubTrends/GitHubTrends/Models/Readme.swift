//
//  Readme.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 21/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

struct Readme: Codable {
    
    let url: String
    let name: String
    let downloadURL: String

    enum CodingKeys: String, CodingKey {
        case url
        case name
        case downloadURL = "download_url"
    }
}
