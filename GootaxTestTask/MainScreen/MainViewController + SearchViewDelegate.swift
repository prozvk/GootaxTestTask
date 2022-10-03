//
//  MainViewController + SearchViewDelegate.swift
//  GootaxTestTask
//
//  Created by MacPro on 03.10.2022.
//

import UIKit

extension MainViewController: SearchViewDelegate {
    
    func selectedAddress(address: Address) {
        var shortAddress = address.data?.street ?? ""
        shortAddress += " "
        shortAddress += address.data?.house ?? ""
        navigationBar.address = shortAddress
    }
}
