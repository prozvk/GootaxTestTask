//
//  UITableViewCell + Extension.swift
//  GootaxTestTask
//
//  Created by MacPro on 03.10.2022.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
