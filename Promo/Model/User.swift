//
//  User.swift
//  Promo
//
//  Created by Илья Першин on 25.01.2021.
//

import Foundation
import FirebaseAuth

struct User {
    var userId: String
    var email: String?
    var name: String
    var visitedPlaces: [VisitedPlace]
}

struct VisitedPlace {
    var placeId: Int
    var visitsCount: Int
}
