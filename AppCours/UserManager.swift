//
//  UserManager.swift
//  AppCours
//
//  Created by Jonathan on 04/12/2017.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserManager {
    
    typealias UserDetailCompletion = (_ user: User?) -> Void
    
    static let shared: UserManager = {
       return UserManager()
    }()

    private init() {}
    
    func getUserDetails(_ completionHandler: @escaping UserDetailCompletion) {
        let parameters = ["results": "1"]
        let headers = ["x-test": "none"]
        let url = "https://randomuser.me/api/"
        
        Alamofire
            .request(url, method: HTTPMethod.get, parameters: parameters, encoding: URLEncoding.default, headers: headers)
            .responseJSON { (response) in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    let list = json["results"].arrayValue
                    print("Successfully fetched \(list.count) results")
                    
                    if let first = list.first {
                        let user = User(json: first)
                        print("Hello \(user.firstname)")
                        completionHandler(user)
                    } else {
                        completionHandler(nil)
                    }
                    
                    break
                case .failure(let error):
                    print("Error: \(error)")
                    completionHandler(nil)
                    break
                }
        }
        
    }
    
}
