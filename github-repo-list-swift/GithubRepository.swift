//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository {
    
    var fullName: String = ""
    var htmlURL: NSURL?
    var repositoryID: String = ""
    
    init(dictionary: NSDictionary) {
        
        if let fullName = dictionary["full_name"] {
            self.fullName = fullName as! String
        }
        
        if let url = dictionary["html_url"] {
            self.htmlURL = NSURL(string: url as! String)
        }
         
        if let id = dictionary["id"] {
            self.repositoryID = String(id)
        }
    }
    
}
