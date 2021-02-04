//
//  User.swift
//  Promo
//
//  Created by Илья Першин on 25.01.2021.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

protocol Convertable {
    func convertToDict() -> [String: Any]
}

struct User: Convertable {
    var userId: String
    var email: String
    var name: String
    var visitedPlaces: [VisitedPlace]
    
    func convertToDict() -> [String: Any] {
        var userDict: [String: Any] = [:]
        
        userDict.updateValue(userId, forKey: "userId")
        userDict.updateValue(email, forKey: "email")
        userDict.updateValue(name, forKey: "name")
        
        for visitedPlace in visitedPlaces {
            userDict.updateValue(visitedPlace.convertToDict(), forKey: "visitedPlaces")
        }
        
        return userDict
    }
    
    init(userId: String, email: String, name: String, visitedPlaces: [VisitedPlace]) {
        self.userId = userId
        self.email = email
        self.name = name
        self.visitedPlaces = visitedPlaces
    }
    
    init(with snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: Any]
        userId = snapshotValue["userId"] as! String
        email = snapshotValue["email"] as! String
        name = snapshotValue["name"] as! String
        visitedPlaces = [] // TODO: 1
    }
}

struct VisitedPlace: Convertable {
    var placeId: Int
    var visitsCount: Int
    
    func convertToDict() -> [String : Any] {
        return [
            "placeId": placeId,
            "visitsCount": visitsCount
        ]
    }
}
