//
//  PropertyListView.swift
//  iOS-challenge
//
//  Created by Silvia España Gil on 1/10/24.
//

import SwiftUI
import Combine

struct PropertyListView: View {
    
    @StateObject private var viewModel = PropertyListViewModel()
    
    var body: some View {
        
        VStack {
            
            if viewModel.isLoading {
                
                ProgressView()
            } else if viewModel.properties.isEmpty {
                
                Text("No properties available")
            } else {
                
                PropertyListViewControllerWrapper(properties: viewModel.properties)
            }
        }
        .navigationTitle("Your future home")
        .onAppear {
            viewModel.loadProperties()
        }
    }
}
