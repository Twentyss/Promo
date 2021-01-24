//
//  ViewController.swift
//  Promo
//
//  Created by Илья Першин on 24.01.2021.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signInButtonPressed() {
        guard
            let email = emailTextField.text, email != "",
            let password = passwordTextField.text, password != ""
        else {
            return
        }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard authDataResult != nil else  {
                return
            }
        }
    
        performSegue(withIdentifier: "signInSegue", sender: nil)
    }
}

