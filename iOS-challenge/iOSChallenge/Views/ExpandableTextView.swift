//
//  ExpandableTextView.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

import SwiftUI

struct ExpandableTextView: View {
    
    let isTextInEnglish: Bool = Locale.current.languageCode == "en"
    
    let text: String
    
    let viewMore: String = NSLocalizedString("expandable_text_view_more_button_label", comment: "See more button label in ExpandableTextView")
    let viewLess: String = NSLocalizedString("expandable_text_view_less_button_label", comment: "See less button label in ExpandableTextView")
    
    @State private var isExpanded = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: .zero) {
            
            if isTextInEnglish {
                
                Text("Message in original language")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.bottom, 8)
            }
            
            Text(text)
                .lineLimit(isExpanded ? nil : 9)
                .lineSpacing(6)
                .padding(.bottom, 8)
            
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                Text(isExpanded ? viewLess : viewMore)
                    .font(.body)
                    .foregroundColor(.green)
            }
        }.padding(.vertical, 8)
    }
}
