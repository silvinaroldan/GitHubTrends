//
//  RepositoryTableViewCell.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 20/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    
    @IBOutlet var name: UILabel!
    @IBOutlet var starsCount: UILabel!
    @IBOutlet var repositoryDescription: UILabel!
    
    var repository: Repository? {
        didSet {
            self.name.text = repository?.name
            self.starsCount.text = "\(repository?.stars ?? 0) Stars"
            self.repositoryDescription.text = repository?.description
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

