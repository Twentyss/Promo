//
//  LaunchViewController.swift
//  Promo
//
//  Created by Илья Першин on 27.01.2021.
//

import UIKit
import FirebaseAuth

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        checkUserDataChange()

        
    }

    func checkUserDataChange() {
//        performSegue(withIdentifier: "fromLaunchToNavigation", sender: nil)
//TODO: Переделать это
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                self.performSegue(withIdentifier: "fromLaunchToNavigation", sender: nil)
                print("true")
            } else {
                self.performSegue(withIdentifier: "fromLaunchToNavigation", sender: nil)
                print("false")
            }
        }
    }
}
