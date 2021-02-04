//
//  SignUpViewController.swift
//  Promo
//
//  Created by Илья Першин on 24.01.2021.
//

import UIKit
import Firebase
import FirebaseDatabase

class SignUpViewController: UIViewController {
    
    private var user: User!
    private var authService: AuthService!
    private var registrService: RegistrationService!
    private var dataService: DataService!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatedPasswordTextField: UITextField!
    
    
    @IBAction func signUpButtonPressed() {
        authService = AuthService()
        registrService = RegistrationService()
        dataService = DataService()
    
        if checkUserData() {
            registrService.register(name: nameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!) { _ in
                self.authorize()
            }
        } else {
                self.showAlert(title: "Registration error", message: "Сheck the entered data")
                self.passwordTextField.text?.removeAll()
                self.repeatedPasswordTextField.text?.removeAll()
        }
    }

    private func checkUserData() -> Bool {
        if  nameTextField.text != nil,
            emailTextField.text != nil,
            passwordTextField.text != nil,
            !nameTextField.text!.isEmpty,
            !emailTextField.text!.isEmpty,
            !passwordTextField.text!.isEmpty,
            repeatedPasswordTextField.text == passwordTextField.text {
            
            return true
            
        } else {
            return false
        }
    }
    
    private func authorize() {
        authService.authorize(with: emailTextField.text!, password: passwordTextField.text!) { (user) in
            if let user = user {
                self.dataService.fetchUserData(by: user.uid) { (userData) in
                    self.user = userData
                }
                self.performSegue(withIdentifier: "signUpSegue", sender: nil)
            } else {
                self.showAlert(title: "Registration error", message: "A user with this email is already registered")
            }
        }
    }
    
    
}

extension SignUpViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let navigationVC = tabBarController.viewControllers?.first as! UINavigationController
        let placesVC = navigationVC.topViewController as! PlacesCollectionViewController
        let profileVC = tabBarController.viewControllers?.last as! ProfileViewController
        
        placesVC.user = self.user
        profileVC.user = self.user
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
