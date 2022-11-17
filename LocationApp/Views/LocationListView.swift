//
//  LocationListView.swift
//  LocationApp
//
//  Created by KhaleD HuSsien on 17/11/2022.
//

import SwiftUI

struct LocationListView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    var body: some View {
        List(locationViewModel.locations) { location in
            Button {
                locationViewModel.showNextLocation(location: location)
            } label: {
                listRowView(location: location)
            }
            .padding(.vertical,5)
            .listRowBackground(Color.clear)
            
        }
        .listStyle(.plain)
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
            .environmentObject(LocationViewModel())
    }
}
//MARK: - listRowView
extension LocationListView{
    private func listRowView(location: Location)-> some View{
        HStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
        }
    }
}
