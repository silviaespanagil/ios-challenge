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
            
            content
        }.toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text(viewModel.localization.title)
                    .font(.title)
            }
        }
        .onAppear {
            viewModel.getProperties()
        }
    }
    
    @ViewBuilder
    private var content: some View {
        
        switch viewModel.viewState {
        case .idle:
            EmptyView()
        case .loading:
            loadingView
        case .loaded:
            loadedView
        }
    }
    
    @ViewBuilder
    private var loadingView: some View {
        
        ProgressView()
    }
    
    @ViewBuilder
    private var loadedView: some View {
        
        PropertyListViewControllerWrapper(properties: viewModel.properties)
    }
}
#Preview {
    PropertyListView()
}
