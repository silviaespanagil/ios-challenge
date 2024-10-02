//
//  PropertyListViewControllerWrapper.swift
//  iOS-challenge
//
//  Created by Silvia España Gil on 1/10/24.
//

import SwiftUI

struct PropertyListViewControllerWrapper: UIViewControllerRepresentable {
    
    let properties: [Property]

    func makeUIViewController(context: Context) -> PropertyListViewController {
        
        return PropertyListViewController(properties: properties)
    }

    func updateUIViewController(_ uiViewController: PropertyListViewController, context: Context) {
        
        uiViewController.properties = properties
    }
}
