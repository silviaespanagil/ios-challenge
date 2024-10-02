//
//  PropertyDetailViewModel.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

import Foundation
import Combine

class PropertyDetailViewModel: ObservableObject {
    
    @Published var propertyDetail: PropertyDetail?
    @Published var detailState: State = .idle
    
    private let getPropertyDetailUseCase: GetPropertyDetailUseCase
    private var cancellable: AnyCancellable?
    
    init() {
        
        self.getPropertyDetailUseCase = GetPropertyDetailUseCase()
    }
    
    func getPropertyDetail() {
        
        detailState = .loading
        
        cancellable = getPropertyDetailUseCase.execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure:
                    break
                }
            }, receiveValue: { [weak self] (detail: PropertyDetail) in
                self?.detailState = .loaded
                self?.propertyDetail = detail
            })
    }
}

extension PropertyDetailViewModel {
    
    enum State {
        case idle
        case loading
        case loaded
    }
}
