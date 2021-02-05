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
    
    @IBOutlet weak var placeImageView: CustomImageView!
    @IBOutlet weak var backgorundPlate: UIView!
    func configureCell(with place: Place) {

        
        
  
       backgorundPlate.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)

      
        
        placeNameLabel.text = place.placeName
        placeDescriptionLabel.text = place.placeDescription
        
        placeNameLabel.textColor = .white
        placeDescriptionLabel.textColor = .white
        backgroundColor = .black
        
                
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.5
        
        
        clipsToBounds = true
        layer.masksToBounds = true

        
  
        
//        placeImageView.layer.cornerRadius = 10
        layer.cornerRadius = 25
        
        DispatchQueue.global().async {
            DispatchQueue.main.async {
                self.placeImageView.fetchImage(from: place.placePhotos.first ?? "")
            }
        }
        
    }
}
