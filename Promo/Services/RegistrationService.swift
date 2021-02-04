//
//  RegistrationService.swift
//  Promo
//
//  Created by Илья Першин on 01.02.2021.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class RegistrationService {
    private var authService = AuthService()
    private var dbReference = Database.database().reference().child("Users")
    
    func register(name: String, email: String, password: String, completion: @escaping (FirebaseAuth.User?) -> Void) {
        createUserInFirebase(with: email, password: password) { (authResult) in
            self.createUserInDatabase(uid: authResult.user.uid, email: email, name: name)
            completion(authResult.user)
        }
    }
    
    private func createUserInFirebase(with email: String, password: String,  completion: @escaping (AuthDataResult) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                print("Register error: \(error.localizedDescription)")
                return
            }
            
            guard let authResult = authResult else { return }
            
            completion(authResult)
        }
    }
    
    private func createUserInDatabase(uid: String, email: String, name: String) {
        let user = User(userId: uid, email: email, name: name, visitedPlaces: [])
        
        dbReference.child(uid).setValue(user.convertToDict())
    }
    
}
