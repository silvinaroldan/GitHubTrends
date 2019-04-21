//
//  ApplicationCoordinator.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 20/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    
    let window: UIWindow
    let rootViewController: UINavigationController
    let repositoryListCoordinator: RepositoryListCoordinator
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        repositoryListCoordinator = RepositoryListCoordinator(presenter: rootViewController)
    }
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        repositoryListCoordinator.start()
    }
}
