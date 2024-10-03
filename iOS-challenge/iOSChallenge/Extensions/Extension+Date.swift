//
//  Extension+Date.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 3/10/24.
//

import Foundation

extension Date {
    
    func formattedDate() -> String {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd/MM/yy"
        
        return dateFormatter.string(from: self)
    }
}
