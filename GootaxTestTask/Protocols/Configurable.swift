//
//  Configurable.swift
//  GootaxTestTask
//
//  Created by MacPro on 28.09.2022.
//

import Foundation

protocol Configurable {
    func configure<Model> (model: Model)
}
