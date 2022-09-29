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
    private var url = "https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address"
    
    public func suggestAddress(_ query: AddressSuggestionQuery, completion: @escaping (_ result: Result<AddressSuggestionResponse, Error>) -> ()) {
        fetchResponse(withQuery: query, completionHandler: completion)
    }
    
    private func fetchResponse<T>(withQuery query: DadataQueryProtocol, completionHandler completion: @escaping (Result<T, Error>) -> ()) where T: Decodable {
       
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.addValue("Token " + token, forHTTPHeaderField: "Authorization")
        
        request.httpBody = try? query.toJSON()
        let session = URLSession.shared
        session.dataTask(with: request){data,response,error in
            
            if let error = error {
                print(error)
                return
            }
            if let response = (response as? HTTPURLResponse), (200...299 ~= response.statusCode) == false {
                completion(.failure(NSError(domain: "Dadata HTTP response", code: response.statusCode)))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "Dadata HTTP response", code: -1)))
                return
            }
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
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
