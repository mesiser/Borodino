//
//  MapViewController.swift
//  Borodino
//
//  Created by Александр Прайд on 09.05.2022.
//

import UIKit

class MapViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .link
        
        setupUIElements()
    }
}

extension MapViewController {
    
    private func setupUIElements() {
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {

        title = K.NavControllerTitle.map_title
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont(name: "Avenir", size: 20)!]
        
    }
    
    
}
