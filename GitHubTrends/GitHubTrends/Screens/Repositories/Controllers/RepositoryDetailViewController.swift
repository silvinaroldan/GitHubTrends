//
//  RepositoryDetailViewController.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 20/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import MarkdownView
import SafariServices
import UIKit

class RepositoryDetailViewController: UIViewController {
    
    @IBOutlet var userAvatarImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var starsCountLabel: UILabel!
    @IBOutlet var forksCountLabel: UILabel!
    @IBOutlet var readmeMarkdownView: MarkdownView!
    @IBOutlet var readmeMarkDownViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet var starsAndForksView: UIView!
    var viewModel: RepositoryDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        
        title = viewModel.repositoryName
        
        userNameLabel.text = viewModel.ownerName
        descriptionLabel.text = viewModel.repositoryDescription
        starsCountLabel.text = viewModel.starsCount
        forksCountLabel.text = viewModel.forksCount
        
        starsAndForksView.makeBorder(color: UIColor.lightGray)
        starsAndForksView.makeRounded(radius: 10.0)
        
        userAvatarImageView.makeRounded()
        
        readmeMarkdownView.isScrollEnabled = false
        
        readmeMarkdownView.onRendered = { [weak self] height in
            self?.readmeMarkDownViewHeightConstraint.constant = height - 300
            self?.view.setNeedsLayout()
        }
        
        readmeMarkdownView.onTouchLink = { [weak self] request in
            guard let url = request.url else { return false }
            
            if url.scheme == "file" {
                return false
            } else if url.scheme == "https" {
                let safari = SFSafariViewController(url: url)
                self?.navigationController?.pushViewController(safari, animated: true)
                return false
            } else {
                return false
            }
        }
        
        viewModel.getRawReadmeFile {
            self.readmeMarkdownView.load(markdown: self.viewModel?.rawReadmeFile)
        }
        
        userAvatarImageView?.setImageWithActivityIndicator(url: URL(string: viewModel!.ownerAvatarURL)!)
    }
}
