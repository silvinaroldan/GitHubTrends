//
//  LoadingIndicator.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 21/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import KRActivityIndicatorView
import KRProgressHUD
import UIKit

enum SpinnerType {
    case statusBarOnly
    case statusBarAndView
}

func showNetworkIndicator(type: SpinnerType = .statusBarAndView) {
    showSmallNetworkIndicator()
    guard type == .statusBarAndView else {
        return
    }
   
    KRProgressHUD.set(activityIndicatorViewColors: [UIColor(named: Constants.Colors.blueGrey)!, UIColor.lightGray])
    KRProgressHUD.set(style: .custom(background: .clear, text: .clear, icon: nil))
    KRProgressHUD.show()
}

func hideNetworkIndicator() {
    hideSmallNetworkIndicator()
    KRProgressHUD.dismiss()
}

func showSmallNetworkIndicator() {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
}

func hideSmallNetworkIndicator() {
    DispatchQueue.main.async {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
