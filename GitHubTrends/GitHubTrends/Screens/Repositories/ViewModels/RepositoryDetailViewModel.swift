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
    let ownerAvatarURL: String
    var readmeFile: Readme?
    var rawReadmeFile: String?
    var showAlert: (() -> Void)?
    
    var errorMessage: AlertInfo? {
        didSet {
            self.showAlert?()
        }
    }
    
    init(repository: Repository) {
        self.repositoryDescription = repository.description ?? ""
        self.starsCount = "\(repository.starsCount) Stars"
        self.forksCount = "\(repository.forksCount) Forks"
        self.repositoryName = repository.name
        self.ownerName = repository.owner.name
        self.repositoryFullName = repository.fullName
        self.ownerAvatarURL = repository.owner.avatarURL
    }
    
    func getReadmeFile(completion: @escaping () -> Void) {
        APIClient.shared.getReadmeFile(repository: self.repositoryFullName) { [weak self] result in
            switch result {
            case .success(let readme):
                self?.readmeFile = readme
            case .failure(let info):
                self?.errorMessage = info
            }
            completion()
        }
    }
    
    func getRawReadmeFile(completion: @escaping () -> Void) {
        self.getReadmeFile {
            guard let readmeFile = self.readmeFile else {
                completion()
                return
            }
            APIClient.shared.getRawReadmeFile(from: readmeFile) { [weak self] result in
                switch result {
                case .success(let readme):
                    self?.rawReadmeFile = readme
                case .failure(let info):
                    self?.errorMessage = info
                }
                completion()
            }
        }
    }
    
}
