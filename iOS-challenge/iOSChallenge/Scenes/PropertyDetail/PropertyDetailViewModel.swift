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
    
    internal func additionalCharacteristicsList(_ characteristics: PropertyCharacteristics) -> [(text: String, image: String)] {
        
        var items: [(String, String)] = []
        
        if let roomNumber = characteristics.roomNumber, roomNumber > 0 {
            items.append(("Habitaciones: \(roomNumber)", "bed.double.fill"))
        }
        
        if let bathNumber = characteristics.bathNumber, bathNumber > 0 {
            items.append(("Baños: \(bathNumber)", "bathtub.fill"))
        }
        
        if characteristics.lift ?? false {
            items.append(("Con ascensor", "arrow.up.to.line.alt"))
        }
        
        if let location = characteristics.flatLocation {
            items.append(("Ubicación: \(location)", "location"))
        }
        
        if let area = characteristics.constructedArea {
            items.append(("Área construida: \(area.formattedDouble) m²", "ruler"))
        }
        
        if let energyCertification = propertyDetail?.energyCertification {
            items.append(("Certificación energética: \(energyCertification.emissions.type.capitalizedFirstLetter)", "leaf"))
        }
        
        return items
    }
}

extension PropertyDetailViewModel {
    
    enum State {
        case idle
        case loading
        case loaded
    }
}
