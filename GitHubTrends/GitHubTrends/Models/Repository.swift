//
//  Repository.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 20/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

struct Repository: Codable {
    
    let id: Int
    let name: String
    let fullName: String
    let stars: Int
    let description: String
  
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case stars = "stargazers_count"
        case fullName = "full_name"
    }
}
