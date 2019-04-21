//
//  RepositoryListCoordinator.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 20/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import UIKit

class RepositoryListCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    private var repositoryListViewController: RepositoryListViewController?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Repositories", bundle: nil)
        if let repositoryListViewController = storyboard.instantiateViewController(withIdentifier: "RepositoryListViewController") as? RepositoryListViewController {
            
            repositoryListViewController.title = Constants.RepositoryList.title
            
            presenter.pushViewController(repositoryListViewController, animated: true)
            self.repositoryListViewController = repositoryListViewController
        }
    }
}
