//
//  PresentAnimation.swift
//  GootaxTestTask
//
//  Created by MacPro on 30.09.2022.
//

import UIKit

/// Класс в котором описана анимация презентации
class PresentAnimation: NSObject {
    let duration: TimeInterval = 0.3

    private func animator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
        let to = transitionContext.view(forKey: .to)!
        
        //finalFrame мы задали в presentationController
        let finalFrame = transitionContext.finalFrame(for: transitionContext.viewController(forKey: .to)!)
                
        // Смещаем контроллер за границу экрана
        to.frame = finalFrame.offsetBy(dx: -finalFrame.width, dy: 0)
        
        // Возвращаем на место, так он выезжает снизу
        let animator = UIViewPropertyAnimator(duration: duration, curve: .easeOut) {
            to.frame = finalFrame
        }
        
        // Завершаем переход, если он не был отменён
        animator.addCompletion { (position) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
        return animator
    }
}

extension PresentAnimation: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let animator = self.animator(using: transitionContext)
        animator.startAnimation()
    }
    
    func interruptibleAnimator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
        return self.animator(using: transitionContext)
    }

}
