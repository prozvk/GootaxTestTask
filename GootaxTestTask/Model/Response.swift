//
//  Response.swift
//  GootaxTestTask
//
//  Created by MacPro on 29.09.2022.
//

import Foundation

struct AddressResponse: Codable {
    let suggestions: [Suggestion]
}

struct Suggestion: Codable {
    let value, unrestrictedValue: String

    enum CodingKeys: String, CodingKey {
        case value
        case unrestrictedValue = "unrestricted_value"
    }
}

// MARK: - Response

public struct AddressSuggestionResponse: Decodable {
    public let suggestions: [AddressSuggestions]?
}

public struct AddressSuggestions: Decodable {
    public let value: String?
    public let data: AddressSuggestionData?
    public let unrestrictedValue: String?
    
    
    enum CodingKeys: String, CodingKey {
        case value
        case data
        case unrestrictedValue = "unrestricted_value"
    }
}

public struct AddressSuggestionData: Decodable {
    public let city : String?
    public let country : String?
    public let flat : String?
    public let house : String?
    public let region : String?
    public let street : String?
    
    enum CodingKeys: String, CodingKey {
        case city = "city"
        case country = "country"
        case flat = "flat"
        case house = "house"
        case region = "region"
        case street = "street"
    }
    
//    public init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        city = try values.decodeIfPresent(String.self, forKey: .city)
//        country = try values.decodeIfPresent(String.self, forKey: .country)
//        flat = try values.decodeIfPresent(String.self, forKey: .flat)
//        house = try values.decodeIfPresent(String.self, forKey: .house)
//        region = try values.decodeIfPresent(String.self, forKey: .region)
//        street = try values.decodeIfPresent(String.self, forKey: .street)
//    }
}

// MARK: - Query

protocol DadataQueryProtocol {
    func toJSON() throws -> Data
}

import Foundation

public class AddressSuggestionQuery: Encodable, DadataQueryProtocol{
    let query: String
    
    public required init(_ query: String){
        self.query = query
    }
    
    enum CodingKeys: String, CodingKey {
        case query
    }
    
    func toJSON() throws -> Data {
        return try JSONEncoder().encode(self)
    }
}
