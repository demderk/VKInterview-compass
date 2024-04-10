//
//  CompassModel.swift
//  VKInterview-compass
//
//  Created by Roman Zheglov on 10.04.2024.
//

import Foundation
import CoreLocation

class CompassDelegate: NSObject, CLLocationManagerDelegate, ObservableObject {
    @Published var degrees = 0.0
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print(degrees)
        degrees = newHeading.magneticHeading
        objectWillChange.send()
    }
}
