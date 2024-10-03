//
//  PropertyDataSource.swift
//  iOS-challenge
//
//  Created by Silvia España Gil on 1/10/24.
//

import Foundation
import Combine

class PropertyDataSource {
    
    static let propertyListEndpoint: String = "list.json"
    static let propertyDetailEndpoint: String = "detail.json"
    
    internal let baseURLString: String
    private let session: URLSession
    
    init(baseURL: String = "https://idealista.github.io/ios-challenge/", session: URLSession = URLSession.shared) {
        self.baseURLString = baseURL
        self.session = session
    }
    
    func getPropertyList() -> AnyPublisher<[ServerProperty], Error> {
        
        let endpoint = "\(baseURLString)\(PropertyDataSource.propertyListEndpoint)"
        
        guard let url = URL(string: endpoint) else {
            return Fail(error: NSError(domain: "Invalid URL", code: -1, userInfo: nil)).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { $0 as Error }
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
                    throw NSError(domain: "Invalid response", code: -1, userInfo: nil)
                }
                return data
            }
            .decode(type: [ServerProperty].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func getPropertyDetail() -> AnyPublisher<ServerPropertyDetail, Error> {
        
        let endpoint = "\(baseURLString)\(PropertyDataSource.propertyDetailEndpoint)"
        
        guard let url = URL(string: endpoint) else {
            return Fail(error: NSError(domain: "Invalid URL", code: -1, userInfo: nil)).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { $0 as Error }
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
                    throw NSError(domain: "Invalid response", code: -1, userInfo: nil)
                }
                return data
            }
            .decode(type: ServerPropertyDetail.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
