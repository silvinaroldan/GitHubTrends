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
    let starsCount: Int
    let forksCount: Int
    let description: String
    let owner: User?
  
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case owner
        case forksCount = "forks_count"
        case starsCount = "stargazers_count"
        case fullName = "full_name"
    }
}
