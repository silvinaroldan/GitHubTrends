//
//  RepositoryDetailCoordinator.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 20/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import UIKit

class RepositoryDetailCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    private var repositoryDetailViewController: RepositoryDetailViewController?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Repositories", bundle: nil)
        if let repositoryDetailViewController = storyboard.instantiateViewController(withIdentifier: "RepositoryDetailViewController") as? RepositoryDetailViewController {
            
            repositoryDetailViewController.title = "Repository Detail"
            presenter.pushViewController(repositoryDetailViewController, animated: true)
            self.repositoryDetailViewController = repositoryDetailViewController
        }
    }
}
