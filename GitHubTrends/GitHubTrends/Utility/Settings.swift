//
//  Settings.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 20/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import Foundation

struct Settings {
    static let shared = Settings()
    
    let apiBaseURL: String
    let debugAlerts: Bool
    
    private init() {
        let settings = Settings.plistDict
        apiBaseURL = settings["apiBaseURL"] as! String
        debugAlerts = (settings["debugAlerts"] as! NSString).boolValue
    }
    
    private static var plistDict: [AnyHashable: Any] {
        let path = Bundle.main.path(forResource: "Info", ofType: "plist")!
        let plist = NSDictionary(contentsOfFile: path) as! [AnyHashable: Any]
        return plist["GitHubTrendsSettings"] as! [AnyHashable: Any]
    }
}
