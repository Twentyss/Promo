//
//  ImageService.swift
//  Promo
//
//  Created by Илья Першин on 05.02.2021.
//

import UIKit

class CustomImageView: UIImageView {
    
    func fetchImage(from url: String) {
        let dataService = DataService()
        
        guard let imageURL = URL(string: url) else {
            //TODO: Загружать заглушку
            return
        }
        
        if let cachedImage = getCachedImage(from: imageURL)  {
            image = cachedImage
            return 
        }

        dataService.fetchImage(from: imageURL) { (data, urlResponse) in
            guard let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.image = image
            }
            
            self.saveDataToCache(with: data, and: urlResponse)
        }
    }
    
    private func getCachedImage(from url: URL) -> UIImage? {
        let urlRequest = URLRequest(url: url)
        
        if let cachedResponseData = URLCache.shared.cachedResponse(for: urlRequest)?.data {
            return UIImage(data: cachedResponseData)
        }
        
        return nil
    }
    
    private func saveDataToCache(with data: Data, and response: URLResponse) {
        guard let url = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        let urlRequest = URLRequest(url: url)
        URLCache.shared.storeCachedResponse(cachedResponse, for: urlRequest)
    }

}
