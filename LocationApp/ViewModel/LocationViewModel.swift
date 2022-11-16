//  LocationViewModel.swift
//  LocationApp
//  Created by KhaleD HuSsien on 16/11/2022.

import Foundation
import MapKit
import SwiftUI

class LocationViewModel: ObservableObject{
    // all loded locations
    @Published var locations: [Location]
    // current location on map
    @Published var mapLocation: Location {
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    private func updateMapRegion(location: Location){
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates,span: span)
        }
    }
}
