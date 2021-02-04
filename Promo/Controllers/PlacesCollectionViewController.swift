//
//  PlacesCollectionViewController.swift
//  Promo
//
//  Created by Илья Першин on 24.01.2021.
//

import UIKit
import FirebaseDatabase


class PlacesCollectionViewController: UICollectionViewController {

    private var dataService: DataService!
    private var places: [Place] = []
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
       
        
        dataService = DataService()
        
        

        
        dataService.fetchPlacesData { (places) in
            self.places = places
            self.collectionView.reloadData()
        }

        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: 30, height: 100)
    
    }
    

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return places.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "placeCell", for: indexPath) as! PlaceCollectionViewCell
       
        cell.configureCell(with: places[indexPath.item])
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

//extension PlacesCollectionViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        CGSize(width: UIScreen.main.bounds.width - 20, height: 250)
//    }
//}
