//
//  PlaceVM.swift
//  PlaceAI
//
//  Created by irfan wahendra on 30/07/24.
//


import Foundation
import GoogleGenerativeAI

@MainActor
class PlaceVM: ObservableObject {
    @Published var place: [Place] = []
    private var apiService: APIServices
    
    init(apiService: APIServices) {
        self.apiService = apiService
    }
    
    func getPlaces() async {
        do {
            let places = try await apiService.fetchPlaces()
            self.place = places
        } catch {
            print("Error fetching places: \(error.localizedDescription)")
        }
    }
    
    
}
