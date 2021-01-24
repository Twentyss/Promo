//
//  SignUpViewController.swift
//  Promo
//
//  Created by Илья Першин on 24.01.2021.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatedPasswordTextField: UITextField!
    
    
    @IBAction func signUpButtonPressed() {
        createUser()
//        performSegue(withIdentifier: "", sender: nil)
    }
    
    private func createUser() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        guard
            let repeatedPassword = repeatedPasswordTextField.text,
            repeatedPassword == password
        else {
            return
        }
        
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
        }
    }
}
