//
//  AddressQuery.swift
//  GootaxTestTask
//
//  Created by MacPro on 30.09.2022.
//

import Foundation

protocol QueryProtocol {
    func toJSON() throws -> Data
}

class AddressQuery: Encodable, QueryProtocol{
    let query: String
    
    init(_ query: String){
        self.query = query
    }
    
    func toJSON() throws -> Data {
        return try JSONEncoder().encode(self)
    }
}
