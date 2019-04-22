//
//  UIViewController.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 22/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(with info: AlertInfo, handler: @escaping () -> Void = {}) {
        let alert = UIAlertController(info: info, handler: handler)
        present(alert, animated: true)
    }
}
