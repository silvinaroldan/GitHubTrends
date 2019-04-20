//
//  AlertInfo.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 20/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import Foundation

class AlertInfo {
    let title: String
    let message: String
    let debugMessage: String?
    let error: Error?
    
    init(title: String, message: String, debugMessage: String? = nil) {
        self.title = title
        self.message = message
        self.debugMessage = debugMessage
        self.error = nil
    }
    
    init(title: String, message: String, error: Error) {
        self.title = title
        self.message = message
        self.debugMessage = error.description
        self.error = error
    }
    
    var finalMessage: String {
        if Settings.shared.debugAlerts, let debug = debugMessage {
            return self.message.with(debugMessage: debug)
        }
        return self.message
    }
    
}
