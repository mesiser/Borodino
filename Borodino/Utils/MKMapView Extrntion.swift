//
//  MKMapView Extrntion.swift
//  Borodino
//
//  Created by Александр Прайд on 25.05.2022.
//

import UIKit
import MapKit

extension MKMapView {
    
    func centerLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
        // setup main location
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        setRegion(coordinateRegion, animated: true)
    }
}
