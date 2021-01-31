//
//  PlacesCollectionViewController.swift
//  Promo
//
//  Created by Илья Першин on 24.01.2021.
//

import UIKit
import FirebaseDatabase
private let reuseIdentifier = "placeCell"

class PlacesCollectionViewController: UICollectionViewController {

    private var database: DatabaseReference!
    private var places: [Place] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        database = Database.database().reference()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //TODO: Вынести в класс DataManger 
        database.child("Places").observe(.value) {[weak self] (snapshot) in
            var places: [Place] = []

            for item in snapshot.children {
                let place = Place(with: item as! DataSnapshot)
                places.append(place)
            }
            
            self?.places = places
            self?.collectionView.reloadData()
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return places.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PlaceCollectionViewCell
        cell.configureCell(with: places[indexPath.item])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

extension PlacesCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 20, height: 250)
    }
}
