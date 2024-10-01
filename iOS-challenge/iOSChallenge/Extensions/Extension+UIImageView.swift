//
//  Extension+UIImageView.swift
//  iOS-challenge
//
//  Created by Silvia España Gil on 1/10/24.
//

import UIKit

extension UIImageView {
    
    func loadImage(from url: URL) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                
                print("Error loading image: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            DispatchQueue.main.async {
                
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}
