//
//  RepositoryDetailViewModel.swift
//  GitHubTrends
//
//  Created by Silvina Roldan on 20/04/2019.
//  Copyright © 2019 Silvina Roldan. All rights reserved.
//

class RepositoryDetailViewModel {
    
    let starsCount: String
    let forksCount: String
    let repositoryDescription: String
    let repositoryName: String
    let repositoryFullName: String
    let ownerName: String
    
    init(repository: Repository) {
        self.repositoryDescription = repository.description
        self.starsCount = "\(repository.starsCount) Stars"
        self.forksCount = "\(repository.forksCount) Forks"
        self.repositoryName = repository.name
        self.ownerName = repository.owner?.name ?? ""
        self.repositoryFullName = repository.fullName
    }
    
}
