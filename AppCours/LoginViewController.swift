//
//  LoginViewController.swift
//  AppCours
//
//  Created by Jonathan on 27/11/2017.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didEditUsername(_ sender: Any) {
        self.updateLoginButton()
    }
    
    @IBAction func didEditPassword(_ sender: Any) {
        self.updateLoginButton()
    }
    
    private func updateLoginButton() {
//        if (usernameField.text?.isEmpty)! || (passwordField.text?.isEmpty)! {
//            loginButton.isEnabled = false
//        } else {
//            loginButton.isEnabled = true
//        }
        guard
            let username = usernameField.text, !username.isEmpty,
            let password = passwordField.text, !password.isEmpty
            else {
                loginButton.isEnabled = false
                return
        }
        
        loginButton.isEnabled = true
    }
    
    @IBAction func didTapOnLogin(_ sender: Any) {
        if let user = usernameField.text, let pass = passwordField.text, !user.isEmpty, !pass.isEmpty {
            print("USER '\(user)', PASS '\(pass)'")
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            if let grantedViewController = storyBoard.instantiateViewController(withIdentifier: "granted") as? GrantedViewController {
                
                grantedViewController.email = user
                grantedViewController.password = pass
                
                self.present(grantedViewController, animated: true, completion: nil)
            }
        }
    }
    
}
