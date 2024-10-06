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
    @Published var favorite: Favorite
    
    private let property: Property
    private let favoritesManager: FavoritesManager
    private let getPropertyDetailUseCase: GetPropertyDetailUseCase
    
    let localization: PropertyDetailLocalization
    
    private var cancellable: AnyCancellable?
    
    init(property: Property, favoritesManager: FavoritesManager = .shared) {
        
        self.getPropertyDetailUseCase = GetPropertyDetailUseCase()
        
        self.localization = PropertyDetailLocalization()
        
        self.property = property
        self.favoritesManager = favoritesManager
        
        self.favorite = favoritesManager.getFavorite(property)
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
            items.append(("\(localization.additionalCharacteristics("roomNumber")): \(roomNumber)", "bed.double.fill"))
        }
        
        if let bathNumber = characteristics.bathNumber, bathNumber > 0 {
            items.append(("\(localization.additionalCharacteristics("bathNumber")): \(bathNumber)", "bathtub.fill"))
        }
        
        if characteristics.lift ?? false {
            items.append(("\(localization.additionalCharacteristics("lift"))", "arrow.up.to.line.alt"))
        }
        
        if let location = characteristics.flatLocation {
            items.append(("\(localization.additionalCharacteristics("flatLocation")): \(location)", "location"))
        }
        
        if let area = characteristics.constructedArea {
            items.append(("\(localization.additionalCharacteristics("constructedArea")): \(area.formattedDouble) m²", "ruler"))
        }
        
        if let energyCertification = propertyDetail?.energyCertification {
            items.append(("\(localization.additionalCharacteristics("energyCertification")): \(energyCertification.emissions.type.capitalizedFirstLetter)", "leaf"))
        }
        
        return items
    }
    
    func toggleFavorite() {
        
        favorite = favoritesManager.toggleFavorite(property)
    }
}

extension PropertyDetailViewModel {
    
    enum State {
        case idle
        case loading
        case loaded
    }
}
