//
//  AuthService.swift
//  Promo
//
//  Created by Илья Першин on 01.02.2021.
//

import Foundation
import FirebaseAuth

class AuthService {
    func authorize(with email: String, password: String, completion: @escaping (FirebaseAuth.User?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Auth failed: \(error.localizedDescription)")
            }

            let user = result?.user
            
            completion(user)
        }
    }
    
    

    
    
    private func authorizeWithoutDataEntry() {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            
            
            let user = auth.currentUser
            
            guard user != nil else { return }
        }
    }
    
}
