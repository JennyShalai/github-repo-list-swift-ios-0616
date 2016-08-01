//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    var repositories: [GithubRepository] = []
    
    func getRepositoriesWithCompletion(completion: () -> ()) {
        
        GithubAPIClient.getRepositoriesWithCompletion ({
            (array) in
            
            self.repositories.removeAll()
            
            for repository in array {
                
                let currentRepository = GithubRepository.init(dictionary: repository as! NSDictionary) // [String: AnyObject]
                
                self.repositories.append(currentRepository)
                
                
            }
            
            if self.repositories.count > 0 {
                completion()
            }
        })
    }
}
