//
//  MapView.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 2/10/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var latitude: Double
    var longitude: Double
    @State private var region: MKCoordinateRegion
    @State private var isLoading = true
    @State private var coordinates: CLLocationCoordinate2D?
    @State private var annotations: [MapAnnotation] = []
    
    // Localization
    let errorMessageTittle: String
    let errorMessage: String
    let errorButtonLabel: String
    
    init(latitude: Double, longitude: Double) {
        
        self.latitude = latitude
        self.longitude = longitude
        _region = State(initialValue: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        ))
        
        self.errorMessageTittle = NSLocalizedString("map_view_error_message_title", comment: "Title if the map don't load")
        self.errorMessage = NSLocalizedString("map_view_error_message", comment: "Message if the map don't load")
        self.errorButtonLabel = NSLocalizedString("map_view_error_button_label", comment: "Button to try loading map again in error view")
    }
    
    func loadMapData() {
        
        coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let annotation = MapAnnotation(latitude: latitude, longitude: longitude)
        
        annotations = [annotation]
        isLoading = false
    }
    
    var body: some View {
        
        if isLoading {
            
            ProgressView()
                .onAppear {
                    loadMapData()
                }
        } else if let coordinates = coordinates {
            
            Map(coordinateRegion: .constant(MKCoordinateRegion(
                center: coordinates,
                span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
            )), annotationItems: annotations) { annotation in
                
                MapPin(coordinate: annotation.coordinate, tint: .red)
            }
            .edgesIgnoringSafeArea(.all)
        } else {
            
            errorView
            Spacer()
        }
    }
}

extension MapView {
    
    @ViewBuilder
    var errorView: some View {
        
        VStack(spacing: 20) {
            Text(errorMessageTittle)
                .font(.headline)
                .multilineTextAlignment(.center)
            
            Text(errorMessage)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Button(action: {
                isLoading = true
                loadMapData()
            }) {
                Text(errorButtonLabel)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.red.opacity(0.9))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color.red.opacity(0.1))
        .cornerRadius(10)
        .padding()
    }
}
