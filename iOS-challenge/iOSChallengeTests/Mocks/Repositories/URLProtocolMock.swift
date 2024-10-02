//
//  URLProtocolMock.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

import Foundation

// Based on Hacking with Swift URLProtocolMock https://www.hackingwithswift.com/articles/153/how-to-test-ios-networking-code-the-easy-way

class URLProtocolMock: URLProtocol {
    
    static var testURLs = [URL?: Data]()
    static var response: URLResponse?
    static var error: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        
        return true
    }
    
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        
        return request
    }
    
    override func startLoading() {
        
        if let url = request.url {
            
            // Load test data if available
            if let data = URLProtocolMock.testURLs[url] {
                
                self.client?.urlProtocol(self, didLoad: data)
            }
            
            // Check for response
            if let response = URLProtocolMock.response {
                
                self.client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            }
            
            // Check for errors
            if let error = URLProtocolMock.error {
                
                self.client?.urlProtocol(self, didFailWithError: error)
            }
        }
        
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
        // Nothing to do
    }
}
