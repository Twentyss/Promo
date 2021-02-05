//
//  DataService.swift
//  Promo
//
//  Created by Илья Першин on 01.02.2021.
//

import Foundation
import FirebaseDatabase

class DataService {
    private var databaseReference = Database.database().reference()
    
    func fetchUserData(by uid: String, completion: @escaping (User) -> Void) {
        self.databaseReference.child("Users").child(uid).observeSingleEvent(of: .value) { (snapshot) in
            let user = User(with: snapshot)

            completion(user)
        }
    }
    
    func fetchPlacesData(completion: @escaping ([Place]) -> Void) {
        self.databaseReference.child("Places").observe(.value) { (snapshot) in
            var places: [Place] = []
            
            for item in snapshot.children {
                let place = Place(with: item as! DataSnapshot)
                places.append(place)
            }
            
            completion(places)
        }
    }
    
    func fetchImage(from url: URL, completion: @escaping (Data, URLResponse) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            guard url == response.url else { return }
            
            completion(data, response)
        }.resume()
    }
}
