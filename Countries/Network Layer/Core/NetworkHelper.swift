//
//  NetworkHelper.swift
//  Countries
//
//  Created by Cakir, Faik on 20.02.2025.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

enum NetworkErrors: String, Error {
    case invalidData = "Invalid data"
    case invalidURL = "Invalid URL"
    case generalError = "An error happened"
}

enum ServiceContants: String {
    case apiHTTPField = "X-RapidAPI-Key"
    case apiKey = "8005e37890msh021268022d63ecap1ecb18jsna3dbde7e3f72"
}

//class NetworkHelper {
//    static let shared = NetworkHelper()
//    
//    let baseUrl = "https://jsonplaceholder.typicode.com/"
//    
//    let header = ["Auth": "Bearer"]
//    
//    func saveToken(token: String) {
//        
//    }
//}
