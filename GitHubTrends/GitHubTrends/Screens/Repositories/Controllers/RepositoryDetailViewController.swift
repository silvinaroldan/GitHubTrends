//
//  RepositoryDetailViewController.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 20/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import UIKit

class RepositoryDetailViewController: UIViewController {
    
    @IBOutlet weak var userAvatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starsCountLabel: UILabel!
    @IBOutlet weak var forksCountLabel: UILabel!
    
    var viewModel: RepositoryDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        userNameLabel.text = viewModel?.ownerName
        descriptionLabel.text = viewModel?.repositoryDescription
        starsCountLabel.text = viewModel?.starsCount
        forksCountLabel.text = viewModel?.forksCount
        
        viewModel?.getRawReadmeFile {
           
        }
    }
}
