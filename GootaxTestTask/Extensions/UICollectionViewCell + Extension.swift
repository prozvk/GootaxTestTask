//
//  UICollectionViewCell + Extension.swift
//  GootaxTestTask
//
//  Created by MacPro on 03.10.2022.
//

import UIKit

extension UICollectionViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
