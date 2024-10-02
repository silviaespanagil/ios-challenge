//
//  ContentView.swift
//  iOS-challenge
//
//  Created by Silvia España Gil on 1/10/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
            
            PropertyListView()
                .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
