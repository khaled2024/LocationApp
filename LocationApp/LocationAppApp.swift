//
//  LocationAppApp.swift
//  LocationApp
//
//  Created by KhaleD HuSsien on 16/11/2022.
//

import SwiftUI

@main
struct LocationAppApp: App {
    @StateObject private var locationViewModel = LocationViewModel()

    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(locationViewModel)
        }
    }
}
