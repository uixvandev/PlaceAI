//
//  Place.swift
//  PlaceAI
//
//  Created by irfan wahendra on 30/07/24.
//

import Foundation

struct Place: Codable, Hashable {
    var place: String
    var activity: String
    var price: String
}

extension Place {
    static let dummyData: [Place] = [
        Place(place: "Padang", activity: "Nature walk, picnic, greenhouse", price: "10000")
    ]
}
