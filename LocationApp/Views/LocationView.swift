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
    let maxWidthForIpad: CGFloat = 700
    //MARK: - Body
    var body: some View {
        ZStack{
            mapLayer
                .ignoresSafeArea()
            VStack{
                header
                    .padding()
                    .frame(maxWidth: maxWidthForIpad)
                Spacer()
                locationPreviewStack
            }
        }
        .sheet(item: $locationViewModel.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(LocationViewModel())
    }
}
//MARK: - Header
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
    // map Layer
    private var mapLayer: some View{
        Map(coordinateRegion: $locationViewModel.mapRegion,
            annotationItems: locationViewModel.locations,
            annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .scaleEffect(locationViewModel.mapLocation == location ? 1 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture {
                        locationViewModel.showNextLocation(location: location)
                    }
            }
        })
    }
    // locationPreviewStack
    private var locationPreviewStack: some View{
        ZStack{
            ForEach(LocationsDataService.locations) { location in
                if locationViewModel.mapLocation == location{
                    LocationPreviewView(location: location)
                        .shadow(color: .black.opacity(0.3), radius: 20)
                        .padding()
                        .frame(maxWidth: maxWidthForIpad)
                // عملنا فرام كمان ع الترانزيشن يبدا من الحافه بتاعت الاسكرين مش من الفرام بتاع الاستاك
                        .frame(maxWidth: .infinity)
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)))
                }
            }
        }
    }
}
