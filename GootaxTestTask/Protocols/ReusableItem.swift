//
//  ReusableItem.swift
//  GootaxTestTask
//
//  Created by MacPro on 28.09.2022.
//

import Foundation

protocol ReusableItem {
    static var reuseIdentifier: String { get }
}

protocol NavigationBarDelegate {
    func presentAddressSearchController()
    
}
