//
//  UIAlertController.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 22/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import UIKit

extension UIAlertController {

    convenience init(info: AlertInfo, handler: @escaping () -> Void = {}) {
        self.init(title: info.title, message: info.finalMessage, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { _ in handler() }
        self.addAction(ok)
    }
}
