//
//  ApiManager.swift
//  GootaxTestTask
//
//  Created by MacPro on 29.09.2022.
//

import Foundation

class ApiManager {
    
    static let shared = ApiManager()
    private init() {}
    
    private let token = "f6d4966f0ae62f72dc4635c7227a83b8ecc28903"
    private let url = "https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address"
    
    func suggestAddress(_ query: QueryProtocol, completion: @escaping (Result<AddressResponse, Error>) -> ()) {
       
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.addValue("Token " + token, forHTTPHeaderField: "Authorization")
        request.httpBody = try? query.toJSON()
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "nil data response", code: -1)))
                return
            }
            do {
                let result = try JSONDecoder().decode(AddressResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(result))
                }
                return
            } catch let error {
                completion(.failure(error))
                return
            }
        }.resume()
    }
}
