//
//  ContentView.swift
//  PlaceAI
//
//  Created by irfan wahendra on 30/07/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var placeVM = PlaceVM(apiService: APIServices())
    
    var body: some View {
        NavigationStack{
            List(placeVM.place, id: \.self) { place in
                PlaceView(place: place)
            }
            
            .overlay{
                placeVM.place.isEmpty ? ProgressView() : nil
            }
            .navigationTitle("Padang")
            .task {
                await placeVM.getPlaces()
            }
        }
    }
}

#Preview {
    MainView()
}
