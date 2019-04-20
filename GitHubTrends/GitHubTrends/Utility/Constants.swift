//
//  Constants.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 20/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

struct Constants {
    
    struct API {
        static let baseURL = Settings.shared.apiBaseURL
         static let searchTrendingRepositories = "search/repositories?q=stars:>=200 &forks:>20&sort=stars&order=desc"
    }
    
    struct ErrorMessage {
        static let somethingWentWrong = "Something went wrong"
        static let search = "Couldn't process the search request"
    }
    
    struct ErrorParse {
        static let offline = "\n\nYour internet connection appears to be offline."
        static let sessionExpired = "Your session has expired"
    }
    
}
