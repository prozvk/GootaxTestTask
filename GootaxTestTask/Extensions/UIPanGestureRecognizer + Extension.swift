//
//  File.swift
//  GootaxTestTask
//
//  Created by MacPro on 30.09.2022.
//

import UIKit

extension UIPanGestureRecognizer {
    func projectedLocation(decelerationRate: UIScrollView.DecelerationRate) -> CGPoint {
        let velocityOffset = velocity(in: view).projectedOffset(decelerationRate: .normal)
        let projectedLocation = location(in: view!) + velocityOffset
        return projectedLocation
    }
}
