//
//  APIServices.swift
//  PlaceAI
//
//  Created by irfan wahendra on 30/07/24.
//

import Foundation
import GoogleGenerativeAI

class APIServices {
    let geminiModel: GenerativeModel
    
    init () {
        geminiModel = GenerativeModel(name: "gemini-pro", apiKey: "YOUR_API_KEY ")
    }
    
    func fetchPlaces() async throws -> [Place] {
        let prompt = """
   give me inspiration for activities that can be done during the day in the city of Padang.
Provide the response as an array of JSON as {["place": "name", "activity": "activities", price: "1000"]} only. Remove any backticks.  
"""
        
        let response = try await geminiModel.generateContent(prompt)
       
        guard let text = response.text, let data = text.data(using: .utf8) else {
            throw NSError(domain: "APIServicesError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unable to extract text or convert to Data"])
        }
        
        let result = try JSONDecoder().decode([Place].self, from: data)
        return result
    }
}
