//
//  RepositoryDetailViewController.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 20/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import UIKit
import MarkdownView

class RepositoryDetailViewController: UIViewController {
    
    @IBOutlet weak var userAvatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starsCountLabel: UILabel!
    @IBOutlet weak var forksCountLabel: UILabel!
    @IBOutlet weak var readmeMarkdownView: MarkdownView!
    @IBOutlet weak var readmeMarkDownViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var starsAndForksView: UIView!
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
        
        starsAndForksView.makeBorder(color: UIColor.lightGray)
        starsAndForksView.makeRounded(radius: 10.0)
        
        readmeMarkdownView.isScrollEnabled = false
        
        readmeMarkdownView.onRendered = { [weak self] height in
            self?.readmeMarkDownViewHeightConstraint.constant = height - 300
            self?.view.setNeedsLayout()
        }
        
        viewModel?.getRawReadmeFile {
            self.readmeMarkdownView.load(markdown: self.viewModel?.rawReadmeFile)
        }
    }
}
