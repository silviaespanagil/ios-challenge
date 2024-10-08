//
//  PropertyRepositoryImplementationTests.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

@testable import iOSChallenge

import Combine
import XCTest

class PropertyRepositoryImplementationUnitTest: XCTestCase {
    
    var sut: PropertyRepositoryImplementation!
    var cancellable: AnyCancellable?
    
    let baseURLString = "https://idealista.github.io/ios-challenge/"
    let successStatusCode = 200
    let failureStatusCode = 401
    let timeoutTime: TimeInterval = 5
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        sut = nil
        cancellable = nil
        try super.tearDownWithError()
    }
    
    func testGetPropertyListFailure() {
        
        // Given
        let session = getPropertySession(statusCode: failureStatusCode)
        let remote = PropertyDataSource(baseURL: baseURLString, session: session)
        sut = PropertyRepositoryImplementation(dataSource: remote)
        
        let exp = expectation(description: "expected failure")
        
        // When
        cancellable = sut.getPropertyList()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTFail("Should not be successful")
                case .failure:
                    exp.fulfill()
                }
            }, receiveValue: { properties in
                XCTFail("Failure case should not receive values")
            })
        
        // Then
        wait(for: [exp], timeout: timeoutTime)
        XCTAssertNotNil(cancellable)
    }
    
    func testGetPropertyListSuccess() {
        
        // Given
        let session = getPropertySession(statusCode: successStatusCode)
        let remote = PropertyDataSource(baseURL: baseURLString, session: session)
        sut = PropertyRepositoryImplementation(dataSource: remote)
        
        let exp = expectation(description: "expected success")
        
        // When
        cancellable = sut.getPropertyList()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    XCTFail("Unexpected error: \(error)")
                }
            }, receiveValue: { properties in
                //Then
                XCTAssertNotNil(properties)
                XCTAssertGreaterThan(properties.count, 0)
                exp.fulfill()
            })
        
        wait(for: [exp], timeout: timeoutTime)
        XCTAssertNotNil(cancellable)
    }
    
    func testGetPropertyDetailFailure() {
        
        // Given
        let session = getPropertyDetailSession(statusCode: failureStatusCode)
        let remote = PropertyDataSource(baseURL: baseURLString, session: session)
        sut = PropertyRepositoryImplementation(dataSource: remote)
        
        let exp = expectation(description: "expected failure")
        
        // When
        cancellable = sut.getPropertyDetail()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTFail("Should not be successful")
                case .failure:
                    exp.fulfill()
                }
            }, receiveValue: { detail in
                XCTFail("Failure case should not receive values")
            })
        
        // Then
        wait(for: [exp], timeout: timeoutTime)
        XCTAssertNotNil(cancellable)
    }
    
    func testGetPropertyDetailSuccess() {
        
        // Given
        let session = getPropertyDetailSession(statusCode: successStatusCode)
        let remote = PropertyDataSource(baseURL: baseURLString, session: session)
        sut = PropertyRepositoryImplementation(dataSource: remote)
        
        let exp = expectation(description: "expected success")
        
        // When
        cancellable = sut.getPropertyDetail()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    XCTFail("Unexpected error: \(error)")
                }
            }, receiveValue: { detail in
                //Then
                XCTAssertNotNil(detail)
                XCTAssertEqual(detail.id, 1)
                exp.fulfill()
            })
        
        wait(for: [exp], timeout: timeoutTime)
        XCTAssertNotNil(cancellable)
    }
}

extension PropertyRepositoryImplementationUnitTest {
    
    // MARK: Mock URLSession for requests
    
    func getPropertySession(statusCode: Int) -> URLSession {
        
        let url = URL(string: "\(baseURLString)list.json")
        let data = getPropertyData()
        
        URLProtocolMock.testURLs = [url: data]
        URLProtocolMock.response = HTTPURLResponse(url: url!,
                                                   statusCode: statusCode,
                                                   httpVersion: nil,
                                                   headerFields: nil)
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        
        let session = URLSession(configuration: config)
        return session
    }
    
    func getPropertyDetailSession(statusCode: Int) -> URLSession {
        
        let url = URL(string: "\(baseURLString)detail.json")
        let data = getPropertyDetailData()
        
        URLProtocolMock.testURLs = [url: data]
        URLProtocolMock.response = HTTPURLResponse(url: url!,
                                                   statusCode: statusCode,
                                                   httpVersion: nil,
                                                   headerFields: nil)
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        
        let session = URLSession(configuration: config)
        return session
    }
}

extension PropertyRepositoryImplementationUnitTest {
    
    // MARK: Data methods
    
    func getPropertyData() -> Data {
        
        let data = """
        [
            {
                "propertyCode": "1",
                "thumbnail": "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/58/60/32/1273036727.webp",
                "floor": "2",
                "price": 1195000.0,
                "priceInfo": {
                    "price": {
                        "amount": 1195000.0,
                        "currencySuffix": "€"
                    }
                },
                "propertyType": "flat",
                "operation": "sale",
                "size": 133.0,
                "exterior": false,
                "rooms": 3,
                "bathrooms": 2,
                "address": "calle de Lagasca",
                "province": "Madrid",
                "municipality": "Madrid",
                "district": "Barrio de Salamanca",
                "country": "es",
                "neighborhood": "Castellana",
                "latitude": 40.4362687,
                "longitude": -3.6833686,
                "description": "Venta.Piso EN EXCLUSIVA. Castellana. Se ofrece en venta vivienda de 133 m² en el exclusivo Barrio de Salamanca...",
                "multimedia": {
                    "images": [
                        {
                            "url": "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/58/60/32/1273036727.webp",
                            "tag": "livingRoom"
                        },
                        {
                            "url": "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/a1/0f/ee/1273036728.webp",
                            "tag": "unknown"
                        }
                    ]
                },
                "features": {
                    "hasAirConditioning": true,
                    "hasBoxRoom": false
                }
            }
        ]
        """
        return Data(data.utf8)
    }
    
    func getPropertyDetailData() -> Data {
        
        let data = """
        {
            "adid": 1,
            "price": 1195000.0,
            "priceInfo": {
                "amount": 1195000.0,
                "currencySuffix": "€"
            },
            "operation": "sale",
            "propertyType": "homes",
            "extendedPropertyType": "flat",
            "homeType": "flat",
            "state": "active",
            "multimedia": {
                "images": [
                    {
                        "url": "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/58/60/32/1273036727.webp",
                        "tag": "livingRoom",
                        "localizedName": "Salón",
                        "multimediaId": 1273036727
                    },
                    {
                        "url": "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/a1/0f/ee/1273036728.webp",
                        "tag": "unknown",
                        "localizedName": "Desconocido",
                        "multimediaId": 1273036728
                    },
                    {
                        "url": "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/79/6b/e0/1273036729.webp",
                        "tag": "views",
                        "localizedName": "Vistas",
                        "multimediaId": 1273036729
                    }
                ]
            },
            "propertyComment": "Venta.Piso EN EXCLUSIVA. Castellana. Se ofrece en venta vivienda de 133 m² en el exclusivo Barrio de Salamanca...",
            "ubication": {
                "latitude": 40.4362687,
                "longitude": -3.6833686
            },
            "country": "es",
            "moreCharacteristics": {
                "communityCosts": 330.0,
                "roomNumber": 3,
                "bathNumber": 2,
                "exterior": false,
                "housingFurnitures": "unknown",
                "agencyIsABank": false,
                "energyCertificationType": "e",
                "flatLocation": "internal",
                "modificationDate": 1727683968000,
                "constructedArea": 133,
                "lift": true,
                "boxroom": false,
                "isDuplex": false,
                "floor": "2",
                "status": "renew"
            },
            "energyCertification": {
                "title": "Certificado energético",
                "energyConsumption": {
                    "type": "e"
                },
                "emissions": {
                    "type": "e"
                }
            }
        }
        """
        return Data(data.utf8)
    }
}
