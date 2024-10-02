//
//  PropertyListViewModel.swift
//  iOS-challenge
//
//  Created by Silvia España Gil on 1/10/24.
//

import Combine
import Foundation

class PropertyListViewModel: ObservableObject {
    
    @Published var properties: [Property] = []
    @Published var viewState: State = .idle
    
    private let getAllPropertiesUseCase: GetAllPropertiesUseCase
    private var cancellable: AnyCancellable?
    
    init() {
        
        self.getAllPropertiesUseCase = GetAllPropertiesUseCase()
    }
    
    func getProperties() {
        
        viewState = .loading
        
        cancellable = getAllPropertiesUseCase.execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                    
                case .finished:
                    break
                    
                case .failure(let error):
                    print("Error fetching properties: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] (loadedProperties: [Property]) in
                
                self?.viewState = .loaded
                self?.properties = loadedProperties
            })
    }
}

extension PropertyListViewModel {
    
    enum State {
        
        case idle
        case loading
        case loaded
    }
}
