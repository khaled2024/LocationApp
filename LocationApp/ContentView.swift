//
//  ContentView.swift
//  LocationApp
//
//  Created by KhaleD HuSsien on 16/11/2022.

import SwiftUI

struct ContentView: View {
    //MARK: - Body
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}
//MARK: - Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
