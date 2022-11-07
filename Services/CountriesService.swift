//
//  CountryService.swift
//  Countries
//
//  Created by Faik on 4.11.2022.
//

import Foundation

class CountriesService: ObservableObject {
    
    init() {
        getAllCountries()
    }
    
    @Published var countryList: [Country] = []
    @Published var showAlert: Bool = false
    
    ///  Retrieves all countries from the endpoint sets it to countryList environement variable
    func getAllCountries() {
        
        guard var url = URLComponents(string: baseURL) else { return }
        url.queryItems = [
            URLQueryItem(name: "limit", value: "10")
        ]
        var urlRequest = URLRequest(url: url.url!)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue(apiKey, forHTTPHeaderField: apiHTTPField)
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    do {
                        if let countries = data {
                            let decodeData = try JSONDecoder().decode(CountriesModel.self, from: countries)
                            DispatchQueue.main.async {
                                self.countryList = decodeData.data
                            }
                        }
                    }
                    catch {
                        print(String(describing: error))
                        self.showAlert = true
                    }
                } else {
                    self.showAlert = true
                }
            }
        }.resume()
    }
}

