//
//  CGFloat + Extension.swift
//  GootaxTestTask
//
//  Created by MacPro on 03.10.2022.
//

import UIKit

extension CGFloat {
    func projectedOffset(decelerationRate: UIScrollView.DecelerationRate) -> CGFloat {
        // Magic formula from WWDC
        let multiplier = 1 / (1 - decelerationRate.rawValue) / 1000
        return self * multiplier
    }
}
