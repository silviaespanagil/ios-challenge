//
//  ExpandableTextView.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

import SwiftUI

struct ExpandableTextView: View {
    
    let text: String
    
    @State private var isExpanded = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: .zero) {
            
            Text(text)
                .lineLimit(isExpanded ? nil : 9)
                .lineSpacing(6)
                .padding(.bottom, 6)
            
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                Text(isExpanded ? "Ver menos" : "Ver más")
                    .font(.body)
                    .foregroundColor(.green)
            }
        }.padding(.vertical, 8)
    }
}
