//
//  UIView.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 21/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import UIKit

extension UIView {
    func makeRounded(radius: CGFloat? = nil) {
        layer.cornerRadius = radius ?? bounds.height / 2.0
        clipsToBounds = true
    }

    func makeBorder(size: CGFloat = 1.0, color: UIColor = .white) {
        layer.borderWidth = size
        layer.borderColor = color.cgColor
    }
}
