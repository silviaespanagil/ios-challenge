//
//  Extension+Double.swift
//  iOS-challenge
//
//  Created by Silvia España Gil on 1/10/24.
//

import Foundation

extension Double {
    
    var formattedDouble: String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
