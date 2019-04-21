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
    private var repositoryDetailCoordinator: RepositoryDetailCoordinator?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Repositories", bundle: nil)
        if let repositoryListViewController = storyboard.instantiateViewController(withIdentifier: "RepositoryListViewController") as? RepositoryListViewController {
            
            repositoryListViewController.title = Constants.RepositoryList.title
            repositoryListViewController.delegate = self
            
            presenter.pushViewController(repositoryListViewController, animated: true)
            self.repositoryListViewController = repositoryListViewController
        }
    }
}

extension RepositoryListCoordinator: RepositoryListViewControllerDelegate {
    
    func select(repository: Repository) {
        let repositoryDetailCoordinator = RepositoryDetailCoordinator(presenter: presenter, repository: repository)
        repositoryDetailCoordinator.start()
        
        self.repositoryDetailCoordinator = repositoryDetailCoordinator
    }
    
}
