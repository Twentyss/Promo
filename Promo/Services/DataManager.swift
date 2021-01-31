//
//  DataManager.swift
//  Promo
//
//  Created by Илья Першин on 27.01.2021.
//

import Foundation
import FirebaseDatabase

//class DataManager {
//    static let shared = DataManager()
//    private let database = Database.database().reference()
//
//    private let places: [Place] = [
//        Place(placeId: 1, placeName: "Тремпель", placeDescription: "Хорошее место", placePhotos: [], promoutionId: 1, placeType: .hookahBar),
//        Place(placeId: 2, placeName: "Сидрерия", placeDescription: "Отличный паб", placePhotos: [], promoutionId: 2, placeType: .pub),
//        Place(placeId: 3, placeName: "Гвозди", placeDescription: "Громко и весело", placePhotos: [], promoutionId: 3, placeType: .club),
//        Place(placeId: 4, placeName: "Гэтсби", placeDescription: "Очень дымный и вкусный кальян", placePhotos: ["Some photos"], promoutionId: 1, placeType: .hookahBar),
//        Place(placeId: 5, placeName: "Перец", placeDescription: "Вкусная пицца", placePhotos: ["Some photos"], promoutionId: 2, placeType: .cafe),
//        Place(placeId: 6, placeName: "Гастробар", placeDescription: "Вкусная еда", placePhotos: [], promoutionId: 2, placeType: .eatery),
//        Place(placeId: 7, placeName: "KFC", placeDescription: "Курочка", placePhotos: [], promoutionId: 3, placeType: .cafe),
//        Place(placeId: 8, placeName: "McDonalds", placeDescription: "Парапапапа", placePhotos: [], promoutionId: 3, placeType: .cafe),
//        Place(placeId: 9, placeName: "Ассорти", placeDescription: "Вкусная еда", placePhotos: [], promoutionId: 2, placeType: .cafe),
//        Place(placeId: 10, placeName: "Burger King", placeDescription: "Жарим мясо", placePhotos: [], promoutionId: 4, placeType: .cafe),
//        Place(placeId: 11, placeName: "Smoke House", placeDescription: "Лучшие кальяны", placePhotos: [], promoutionId: 3, placeType: .hookahBar),
//        Place(placeId: 12, placeName: "Urban", placeDescription: "Уютное место", placePhotos: [], promoutionId: 4, placeType: .hookahBar)
//    ]
//
//    func addNewPlace(with placeObject: Place) {
//        let placeObject = Place(
//            placeId: placeObject.placeId,
//            placeName: placeObject.placeName,
//            placeDescription: placeObject.placeDescription,
//            placePhotos: placeObject.placePhotos,
//            promoutionId: placeObject.promoutionId,
//            placeType: placeObject.placeType)
//
//        database.child("Places").child("\(placeObject.placeId)").setValue(placeObject.converToDict())
//    }
//
//    func addNewPlaces() {
//        for place in places {
//            addNewPlace(with: place)
//        }
//    }
//
//
//    private init() { }
//}
