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
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $locationViewModel.mapRegion)
                .ignoresSafeArea()
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(LocationViewModel())
    }
}
