//
//  MonumentModel.swift
//  Borodino
//
//  Created by Александр Прайд on 23.05.2022.
//

import Foundation

struct Monument: Decodable {
    
    var id: Int
    var title: String
    var image: String
    var content: String
    var lon: Double
    var lat: Double
}
