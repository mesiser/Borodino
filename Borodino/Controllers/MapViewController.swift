//
//  MapViewController.swift
//  Borodino
//
//  Created by Александр Прайд on 09.05.2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUIElements()
        
        let initialLocation = CLLocation(latitude: 55.52840641426701, longitude: 35.819833960068735)
        mapView.centerLocation(initialLocation)
    }
}

// MARK: - Setup UI Elements
extension MapViewController {
    
    private func setupUIElements() {
        setupNavigationBar()
        setupMapView()
    }
    
    private func setupNavigationBar() {

        title = K.NavControllerTitle.map_title
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont(name: "Avenir", size: 20)!]
        
    }
    
    private func setupMapView() {
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    
}
