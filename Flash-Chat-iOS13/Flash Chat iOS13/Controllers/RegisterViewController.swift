//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        let emailText = emailTextfield.text
        let passwordText = passwordTextfield.text
        if let password = passwordText {
            if let email = emailText{
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    
                    if let saferror = error{
                        print(saferror.localizedDescription)
                    }
                    
                    if let safeAuthResult = authResult {
                        print(safeAuthResult)
                        self.performSegue(withIdentifier: K.registerSegue, sender: self)
                    }
                }
            }
        }
    }
    
    
    
}
