//
//  Date.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 22/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import Foundation

extension Date {
    func addDays(_ number: Int = -7) -> String {
        let day = Calendar.current.date(byAdding: .day, value: number, to: self)
        return DateFormatter.reverseDashed.string(from: day!)

    }
}
