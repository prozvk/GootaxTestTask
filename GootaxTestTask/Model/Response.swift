//
//  Response.swift
//  GootaxTestTask
//
//  Created by MacPro on 29.09.2022.
//

import Foundation

public struct AddressResponse: Decodable {
    public let suggestions: [Address]?
}

public struct Address: Decodable {
    public let value: String?
    public let data: AddressData?
    public let unrestrictedValue: String?
    
    enum CodingKeys: String, CodingKey {
        case value
        case data
        case unrestrictedValue = "unrestricted_value"
    }
}

public struct AddressData: Decodable {
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
}
