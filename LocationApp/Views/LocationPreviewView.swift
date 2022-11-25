//
//  LocationPreviewView.swift
//  LocationApp
//
//  Created by KhaleD HuSsien on 25/11/2022.
//

import SwiftUI

struct LocationPreviewView: View {
    let location: Location
    @EnvironmentObject var locationViewModel: LocationViewModel
    
    var body: some View {
        HStack(alignment: .bottom){
            VStack(alignment: .leading, spacing: 16){
                imageSection
                titleSection
            }
            VStack(spacing: 8){
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .cornerRadius(10)
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.green.ignoresSafeArea()
            LocationPreviewView(location: LocationsDataService.locations.first!)
                .padding()
        }
        .environmentObject(LocationViewModel())
        
    }
}
//MARK: - Extension of Location Preview
extension LocationPreviewView{
    private var imageSection: some View{
        ZStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    private var titleSection: some View{
        VStack(alignment: .leading,spacing: 4){
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity,alignment: .leading)
    }
    private var learnMoreButton: some View{
        Button {
            
        } label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 125, height: 34)
        }
        .buttonStyle(.borderedProminent)
    }
    private var nextButton: some View{
        Button {
            locationViewModel.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 34)
        }
        .buttonStyle(.bordered)
    }
}
