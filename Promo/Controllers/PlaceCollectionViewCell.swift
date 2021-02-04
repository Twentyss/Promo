//
//  PlaceCollectionViewCell.swift
//  Promo
//
//  Created by Илья Першин on 25.01.2021.
//

import UIKit

class PlaceCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeDescriptionLabel: UILabel!
    
    func configureCell(with place: Place) {
        placeNameLabel.text = place.placeName
        placeDescriptionLabel.text = place.placeDescription
        
        placeNameLabel.textColor = .white
        placeDescriptionLabel.textColor = .white
        backgroundColor = .black
        
        
        
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowRadius = 6
//        self.layer.shadowOpacity = 0.25
//        self.clipsToBounds = false
//        self.layer.masksToBounds = false
        
        layer.cornerRadius = 10
        
        
    }
}
