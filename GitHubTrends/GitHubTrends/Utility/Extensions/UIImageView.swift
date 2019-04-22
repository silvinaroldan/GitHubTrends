//
//  UIImageView.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 21/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import AlamofireImage
import UIKit

extension UIImageView {
    
    func setImage(with url: URL?, defaultImage: UIImage? = nil) {
        if let theURL = url {
            af_setImage(withURL: theURL, placeholderImage: defaultImage)
        } else {
            image = defaultImage
        }
    }
    
    func setImageWithActivityIndicator(url: URL?, defaultImage: UIImage? = nil) {
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        activityIndicator.center = self.center
        self.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        if let theURL = url {
            af_setImage(withURL: theURL, placeholderImage: defaultImage, filter: nil, progress: nil, imageTransition: .crossDissolve(0.5)) { result in
                self.image = result.value
                activityIndicator.stopAnimating()
            }
        } else {
            image = defaultImage
        }
    }
    
}
