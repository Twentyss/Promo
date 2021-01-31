//
//  Place.swift
//  Promo
//
//  Created by Илья Першин on 25.01.2021.
//

import Foundation
import FirebaseDatabase

struct Place: Codable {
    var placeId: Int
    var placeName: String
    var placeDescription: String
    var placePhotos: [String]
    var promoutionId: Int
    var placeType: PlaceType
    
    init(with snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: Any]
        placeId = 1
        placeName = snapshotValue["placeName"] as! String
        placeDescription = snapshotValue["placeDescription"] as! String
        placePhotos = snapshotValue["placePhotos"] as? [String] ?? []
        promoutionId = snapshotValue["promoutionId"] as! Int
        placeType = .hookahBar
    }
}

struct Promoution: Codable {
    var promoutionId: Int
    var requiredVisits: Int
    var promoutionDescription: Int
}

enum PlaceType: String, Codable {
    case cafe = "Кафе"
    case pub = "Паб"
    case restaurant = "Ресторан"
    case club = "Клуб"
    case eatery = "Столовая"
    case hookahBar = "Кальянная"
    case bar = "Бар"
}



