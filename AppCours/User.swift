//
//  User.swift
//  AppCours
//
//  Created by Jonathan on 04/12/2017.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {
    var firstname: String
    var lastname: String
    var email: String
    var phone: String
    var picture: String
    
    init(json: JSON) {
        firstname = json["name"]["first"].stringValue
        lastname = json["name"]["last"].stringValue
        email = json["email"].stringValue
        phone = json["phone"].stringValue
        picture = json["picture"]["large"].stringValue
    }
}
