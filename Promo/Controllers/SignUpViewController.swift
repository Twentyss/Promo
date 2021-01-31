//
//  SignUpViewController.swift
//  Promo
//
//  Created by Илья Першин on 24.01.2021.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    private var user: User!

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatedPasswordTextField: UITextField!
    
    
    @IBAction func signUpButtonPressed() {
        createUser()
//        performSegue(withIdentifier: "", sender: nil)
    }
    
//    private func createUser() {
//        guard let (email, password) = validateUserData() else { return }
//
//
//        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
//            if let error = error {
//                print(error.localizedDescription)
//                return
//            }
//        }
//    }
    
    private func createUser() {
        createUserModel()
        createUserInFirebase()
    }
    
    private func createUserModel() {
        
        
    }
    
    private func createUserInFirebase() {
        
    }
    
    
    private func validateUserData() -> (String, String)? {
        guard let email = emailTextField.text else { return nil }
        guard let password = passwordTextField.text else { return nil }
        
        
        guard
            let repeatedPassword = repeatedPasswordTextField.text,
            repeatedPassword == password
        else {
            return nil
        }
        
        return (email, password)
    }
}
