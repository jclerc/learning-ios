//
//  GrantedViewController.swift
//  AppCours
//
//  Created by Jonathan on 27/11/2017.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit

class GrantedViewController: UIViewController {
    
    var email: String!
    var password: String!

    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainLabel.text = "Bienvenue \(self.email ?? "")..."
        
        UserManager.shared.getUserDetails { (user) in
            if let user = user {
                self.mainLabel.text = "Tu es maintenant \(user.firstname) !"
            } else {
                self.mainLabel.text = "Erreur :("
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
