//
//  ProfileViewController.swift
//  Promo
//
//  Created by Илья Першин on 25.01.2021.
//

import UIKit
import FirebaseDatabase

class ProfileViewController: UIViewController {
    
    private let database = Database.database().reference()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        database.child("Places").observeSingleEvent(of: .value) { (data) in
            guard let value = data.value as? [String: Any] else {
                return
            }
            print(value)
        }
     
     
    }
    
    
}
