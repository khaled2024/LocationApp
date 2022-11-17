//
//  Location.swift
//  LocationApp
//
//  Created by KhaleD HuSsien on 16/11/2022.
//

import Foundation
import MapKit
struct Location: Identifiable,Equatable{
   
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    // id :-
    var id: String{
        name + cityName
    }
    //Equatable  -> for animation
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    
}
