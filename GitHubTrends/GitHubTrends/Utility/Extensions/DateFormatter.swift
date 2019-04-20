//
//  DateFormatter.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 20/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static let slashed = formatter(withDateFormat: "MM/dd/yyyy")
    static let reverseDashed = formatter(withDateFormat: "YYYY-MM-dd")
    static let iso8601 = formatter(withDateFormat: "YYYY-MM-DDTHH:MM:SSZ")
    
    static func formatter(withDateFormat dateFormat: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter
    }
    
}
