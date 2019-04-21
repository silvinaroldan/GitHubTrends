//
//  User.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 21/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

struct User: Codable {
    let id: Int
    let name: String
    let avatarURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "login"
        case avatarURL = "avatar_url"
    }
}
