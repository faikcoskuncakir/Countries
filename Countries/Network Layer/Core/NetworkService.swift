//
//  NetworkService.swift
//  Countries
//
//  Created by Cakir, Faik on 20.02.2025.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func requestWithURLSession<T: Codable>(url: String, method: HTTPMethods, queryItems: [URLQueryItem]? = nil, completion: @escaping (Result<T, NetworkErrors>) -> Void) {
        var components = URLComponents(string: url)
        components?.queryItems = queryItems
        
        guard let finalURL = components?.url else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = method.rawValue
        request.setValue(ServiceContants.apiKey.rawValue, forHTTPHeaderField: ServiceContants.apiHTTPField.rawValue)
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let error = error as? NetworkErrors {
                completion(.failure(error))
            } else if let data = data {
                self.handleResponse(data: data, completion: completion)
            } else {
                completion(.failure(.invalidData))
            }
        }
        dataTask.resume()
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
