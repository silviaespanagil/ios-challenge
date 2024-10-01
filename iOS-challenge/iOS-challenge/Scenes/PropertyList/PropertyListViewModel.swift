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
    @Published var isLoading: Bool = false
    
    private let getAllPropertiesUseCase: GetAllPropertiesUseCase
    private var cancellable: AnyCancellable?
    
    init() {
        
        self.getAllPropertiesUseCase = GetAllPropertiesUseCase()
    }
    
    func getProperties() {
        
        isLoading = true
        
        cancellable = getAllPropertiesUseCase.execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                
                self.isLoading = false
                
                switch completion {
                    
                case .finished:
                    break
                    
                case .failure(let error):
                    print("Error fetching properties: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] (loadedProperties: [Property]) in
                
                self?.properties = loadedProperties
            })
    }
}
