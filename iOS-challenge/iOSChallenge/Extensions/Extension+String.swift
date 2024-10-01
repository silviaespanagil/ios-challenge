//
//  Extension+String.swift
//  iOS-challenge
//
//  Created by Silvia España Gil on 1/10/24.
//

extension String {
    
    var capitalizedFirstLetter: String {
        
        guard let firstCharacter = self.first else { return self }
        return "\(firstCharacter.uppercased())\(self.dropFirst())"
    }
}
