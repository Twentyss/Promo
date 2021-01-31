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
    
    private var database: DatabaseReference!
    private var user: User!
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
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let result = result else { return }
            print(result.user.email!)
        }
        
        performSegue(withIdentifier: "signInSegue", sender: nil)
    }
    
    
}

extension SignInViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO: Передать модель User на следующий экран
    }
}
