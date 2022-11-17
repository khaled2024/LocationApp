//
//  LocationView.swift
//  LocationApp
//
//  Created by KhaleD HuSsien on 16/11/2022.
//

import SwiftUI
import MapKit

struct LocationView: View {
    @EnvironmentObject private var locationViewModel: LocationViewModel
//MARK: - Body
    var body: some View {
        ZStack{
            Map(coordinateRegion: $locationViewModel.mapRegion)
                .ignoresSafeArea()
            VStack{
                header
                    .padding()
                Spacer()
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(LocationViewModel())
    }
}
//MARK: - header
extension LocationView{
    private var header: some View{
        VStack {
            Button(action: locationViewModel.toggleLocationList) {
                Text(locationViewModel.mapLocation.name + " " + locationViewModel.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: locationViewModel.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                        // to rotate the arrow
                            .rotationEffect(Angle(degrees: locationViewModel.showLocationList ? 0 : 180))
                    }
            }
            // to hide the list at the beggining
            if locationViewModel.showLocationList{
                LocationListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 15)
        
    }
}
