//
//  SearchPresenter.swift
//  GootaxTestTask
//
//  Created by MacPro on 29.09.2022.
//

import Foundation
import UIKit

protocol SearchPresenterProtocol: class {
    func fetchAddresses(text: String)
}

class SearchPresenter: SearchPresenterProtocol {
    
    weak var view: SearchViewProtocol?
    
    var addresses: [Address] = [] {
        didSet {
            view?.reloadData(addresses: addresses)
        }
    }
    
    init(view: SearchViewProtocol) {
        self.view = view
    }
    
    func fetchAddresses(text: String) {
        ApiManager.shared.suggestAddress(AddressQuery(text)) { [weak self] (result) in
            switch result {
            case .success(let response):
                if let addresses = response.suggestions {
                    self?.addresses = addresses
                }
                
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}
