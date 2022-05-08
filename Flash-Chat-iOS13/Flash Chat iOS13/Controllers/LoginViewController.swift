//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        let emailText = emailTextfield.text
        let passwordText = passwordTextfield.text
        if let password = passwordText, let email = emailText {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let safeError = error {
                    print(safeError.localizedDescription)
                }
                
                if let safeResult = authResult {
                    print(safeResult)
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
    
}
