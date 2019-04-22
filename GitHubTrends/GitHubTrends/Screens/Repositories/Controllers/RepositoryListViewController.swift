//
//  RepositoryListViewController.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 20/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import UIKit

protocol RepositoryListViewControllerDelegate: class {
    func select(repository: Repository)
}

class RepositoryListViewController: UIViewController {
    
    weak var delegate: RepositoryListViewControllerDelegate?
    private var viewModel = RepositoryListViewModel()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet var repositoryListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
        setupTableView()
        loadRepositories()
    }
    
    func loadRepositories() {
        showNetworkIndicator()
        viewModel.loadRepositories {
            hideNetworkIndicator()
            self.repositoryListTableView.reloadData()
        }
    }
    
    func setupTableView() {
        repositoryListTableView.estimatedRowHeight = 140
        repositoryListTableView.rowHeight = UITableView.automaticDimension
        repositoryListTableView.tableFooterView = UIView()
        
        viewModel.reloadTableViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.repositoryListTableView.reloadData()
            }
        }
    }
    
    func setupSearchBar() {
        navigationItem.searchController = searchController
 
        searchController.searchBar.delegate = viewModel
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true
    }
}

extension RepositoryListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryTableViewCell", for: indexPath) as! RepositoryTableViewCell
        cell.repository = viewModel.itemAtIndex(indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let repository = viewModel.itemAtIndex(indexPath.row) else {
            return
        }
        delegate?.select(repository: repository)
    }
}
