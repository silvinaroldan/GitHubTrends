//
//  RepositoryListViewModel.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 20/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

class RepositoryListViewModel {
    
    var items: [Repository] = []
    var errorMessage: AlertInfo?
    var count: Int {
        return items.count
    }
    
    func loadRepositories(completion: @escaping () -> Void) {
        APIClient.shared.searchTrendingRepositories { [weak self] result in
            switch result {
            case .success(let repositoryList):
                self?.items = repositoryList
            case .failure(let info):
                self?.errorMessage = info
            }
            completion()
        }
    }
    
    func itemAtIndex(_ index: Int) -> Repository? {
        if items.count > index {
            return items[index]
        }
        return nil
    }
    
}
