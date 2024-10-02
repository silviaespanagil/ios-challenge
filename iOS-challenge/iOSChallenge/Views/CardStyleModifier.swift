//
//  CardStyleModifier.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

import SwiftUI

struct CardStyleModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

extension View {
    
    func cardStyle() -> some View {
        
        self.modifier(CardStyleModifier())
    }
}
