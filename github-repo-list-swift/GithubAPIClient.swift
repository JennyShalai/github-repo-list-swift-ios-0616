//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
    
    class func getRepositoriesWithCompletion(completion: NSArray -> ()) {
        
        // 1. create a session
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        // 2. create task for this session
        // 2.1 for this URL
        if let url = NSURL(string: gitURL) {
            
            // 2.2 make a task that will
            let task = session.dataTaskWithURL(url) {
                (data, response, error) in
                
                // 2.3 get response
                if let data = data {
                    
                    do {
                        // response data from github server as JSON, convert to array
                        let responseData = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSArray
                        print(responseData)
                        completion(responseData)
                        
                    } catch {
                        print("Error: \(error)")
                    }
                }
            }
            // 3. begin request to server (with created session and task)
            task.resume()
        }
    }
}
