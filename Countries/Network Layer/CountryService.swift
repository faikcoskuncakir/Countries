//
//  CountryService.swift
//  Countries
//
//  Created by Faik on 4.11.2022.
//


import Foundation

class CountryService {
    
    /// Retrieves the details of a country from the endpoint
    /// - parameter code : Code of the Country
    /// - returns: the detailed info of the country
    func getCountryDetail(code: String, completionHandler: @escaping (CountryModel) -> Void) {
        guard let url = URL(string: baseURL + code) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue(apiKey, forHTTPHeaderField: apiHTTPField)
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    do {
                        if let country = data {
                            let decodeData = try JSONDecoder().decode(CountryModel.self, from: country)
                            DispatchQueue.main.async {
                                completionHandler(decodeData)
                            }
                        }
                    }
                    catch {
                        print(String(describing: error))
                    }
                } else {
                    
                }
            }
        }.resume()
    }
}
