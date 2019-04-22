//
//  RepositoryListViewModel.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 20/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//
import UIKit
import Foundation

class RepositoryListViewModel: NSObject {
    
    var items: [Repository] = []
    var inSearchMode = false
    var reloadTableView: (() -> Void)?
    var showAlert: (() -> Void)?
    
    var filteredItems: [Repository] = [] {
        didSet {
            reloadTableView?()
        }
    }
    
    var errorMessage: AlertInfo? {
        didSet {
            showAlert?()
        }
    }
  
    var count: Int {
        if inSearchMode {
            return filteredItems.count
        } else {
            return items.count
        }
    }
    
    func loadRepositories(completion: @escaping () -> Void) {
        APIClient.shared.getTrendingRepositories { [weak self] result in
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
        if inSearchMode {
            if filteredItems.count > index {
                return filteredItems[index]
            }
        } else {
            if items.count > index {
                return items[index]
            }
        }
        return nil
    }
}

extension RepositoryListViewModel: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text!.isEmpty {
            resetSearchBar(searchBar)
        } else {
            inSearchMode = true
            filteredItems = items.filter({
                $0.fullName.lowercased().contains(searchText.lowercased())
            })
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        resetSearchBar(searchBar)
    }
    
    func resetSearchBar(_ searchBar: UISearchBar) {
        inSearchMode = false
        searchBar.endEditing(true)
        filteredItems = []
    }
    
}
