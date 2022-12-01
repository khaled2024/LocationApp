//  LocationViewModel.swift
//  LocationApp
//  Created by KhaleD HuSsien on 16/11/2022.

import Foundation
import MapKit
import SwiftUI

class LocationViewModel: ObservableObject{
    //MARK: - VARS
    // All loded locations
    @Published var locations: [Location]
    // Current location on map
    @Published var mapLocation: Location {
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }
    // Current regin in map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    // Show list at Location
    @Published var showLocationList: Bool = false
    // show location details
    @Published var sheetLocation: Location? = nil
    
    // Init
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    //MARK: - Functions
    private func updateMapRegion(location: Location){
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates,span: span)
        }
    }
    func toggleLocationList(){
        withAnimation(.easeInOut) {
            showLocationList = !showLocationList
            // or
            // self.showLocationList.toggle()
        }
    }
    // show next location
    func showNextLocation(location: Location){
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationList = false
        }
    }
    // Next location
    func nextButtonPressed(){
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation})else{
            print("could not find current index ")
            return
        }
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else{
            guard let firstLocation = locations.first else{return}
            showNextLocation(location: firstLocation)
            return
        }
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
