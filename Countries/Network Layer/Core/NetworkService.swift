//
//  NetworkService.swift
//  Countries
//
//  Created by Cakir, Faik on 20.02.2025.
//

import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    
    /// URLSession has been added for use if desired.
    func requestWithURLSession<T: Codable>(url: String, method: HTTPMethods, completion: @escaping((Result<T, NetworkErrors>)->Void)) {
        let session = URLSession.shared
        if let url = URL(string: url) {
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            request.setValue(ServiceContants.apiKey.rawValue, forHTTPHeaderField: ServiceContants.apiHTTPField.rawValue)
            
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                if let _ = error {
                    completion(.failure(.generalError))
                } else if let data = data {
                    self.handleResponse(data: data) { response in
                        completion(response)
                    }
                } else {
                    completion(.failure(.invalidURL))
                }
            }
            dataTask.resume()
        }
    }
    
    private func handleResponse<T: Codable>(data: Data, completion: @escaping((Result<T, NetworkErrors>)->Void)) {
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(.success(result))
        } catch {
            completion(.failure(.invalidData))
        }
    }
    
}
