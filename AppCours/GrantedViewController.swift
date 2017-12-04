//
//  GrantedViewController.swift
//  AppCours
//
//  Created by Jonathan on 27/11/2017.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class GrantedViewController: UIViewController {
    
    var email: String!
    var password: String!

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainLabel.text = "Attends \(self.email ?? "?"), ça charge..."
        
        setup(user: nil)
        UserManager.shared.getUserDetails { (user) in
            self.setup(user: user)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup(user: User?) {
        if let user = user {
            self.mainLabel.text = "Tu es maintenant \(user.firstname) !"
            
            self.label1.text = "Firstname: \(user.firstname)"
            self.label2.text = "Lastname: \(user.lastname)"
            self.label3.text = "Email: \(user.email)"
            self.label4.text = "Phone: \(user.phone)"
            
            Alamofire.request(user.picture).responseImage(completionHandler: { (response) in
                if let img = response.result.value {
                    self.picture.image = img
                }
            })
        } else {
            self.label1.text = "Firstname: ..."
            self.label2.text = "Lastname: ..."
            self.label3.text = "Email: ..."
            self.label4.text = "Phone: ..."
        }
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
