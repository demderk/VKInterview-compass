//
//  MainVM.swift
//  VKInterview-compass
//
//  Created by Roman Zheglov on 09.04.2024.
//

import Foundation
import CoreLocation
import Combine

class MainVM : ObservableObject {
    @Published var rotationDegree: Double = 0
    
    private let CMManager = CLLocationManager()
    private let compassDelegate = CompassDelegate()
    
    init() {
        CMManager.delegate = compassDelegate
        CMManager.startUpdatingHeading()
        
        compassDelegate.$degrees
            .assign(to: &$rotationDegree)
    }
}
