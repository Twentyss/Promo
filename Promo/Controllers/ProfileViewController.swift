//
//  ProfileViewController.swift
//  Promo
//
//  Created by Илья Першин on 25.01.2021.
//

import UIKit
import FirebaseDatabase

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var accountIdLabel: UILabel!
    
    
    private let database = Database.database().reference()
    var user: User!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
    }
    
    private func setLabels() {
        emailLabel.text = user.email
        nameLabel.text = user.name
        accountIdLabel.text = user.userId
    }
}
