//
//  ViewController.swift
//  Promo
//
//  Created by Илья Першин on 24.01.2021.
//

import UIKit
import Firebase
import FirebaseDatabase

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var user: User!
    private var authService: AuthService!
    private var dataService: DataService!
    
    override func viewDidLoad() {
        authService = AuthService()
        dataService = DataService()
        super.viewDidLoad()
        
        emailTextField.text = "test1@gmail.com"
        passwordTextField.text = "123456"
    }
    
    @IBAction func signInButtonPressed() {
        if checkUserData() {
            authorize()
        } else {
            showAlert(title: "Sign in error", message: "Fill in all the fields")
        }
    }
    
    private func authorize() {
        authService.authorize(with: emailTextField.text!, password: passwordTextField.text!) { (user) in
            if let user = user {
                self.fetchData(with: user.uid)
            } else {
                self.showAlert(title: "Invalid login or password",
                               message: "Please, enter correct login and password")
                self.passwordTextField.text?.removeAll()
            }
        }
    }
    
    private func fetchData(with uid: String) {
        self.dataService.fetchUserData(by: uid) { (userData) in
            self.user = userData
            self.performSegue(withIdentifier: "signInSegue", sender: nil)
        }
    }
    
    private func checkUserData() -> Bool {
        if  emailTextField.text != nil,
            passwordTextField.text != nil,
            !emailTextField.text!.isEmpty,
            !passwordTextField.text!.isEmpty {
            
            return true
        }
        else {
            return false
        }
    }
    
}

extension SignInViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "signInSegue" {
            let tabBarController = segue.destination as! UITabBarController
            let navigationVC = tabBarController.viewControllers?.first as! UINavigationController
            let placesVC = navigationVC.topViewController as! PlacesCollectionViewController
            let profileVC = tabBarController.viewControllers?.last as! ProfileViewController
            placesVC.user = self.user
            profileVC.user = self.user
        }
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
