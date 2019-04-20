//
//  String.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 20/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

extension String {
    func with(debugMessage: String) -> String {
        return self
            .appending("\n\n⬇️ DEBUG INFO ⬇️\n\n")
            .appending(debugMessage)
    }
}
