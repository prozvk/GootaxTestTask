//
//  TransitionDriver.swift
//  GootaxTestTask
//
//  Created by MacPro on 30.09.2022.
//

import UIKit

enum TransitionDirection {
    case present, dismiss
}

class TransitionDriver: UIPercentDrivenInteractiveTransition {
    
    func link(to controller: UIViewController) {
        presentedController = controller
        
        panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handle(recognizer:)))
        presentedController?.view.addGestureRecognizer(panRecognizer!)
    }
    
    private weak var presentedController: UIViewController?
    private var panRecognizer: UIPanGestureRecognizer?
    
    override var wantsInteractiveStart: Bool {
        get {
            switch direction {
            case .present:
                return false
            case .dismiss:
                let gestureIsActive = panRecognizer?.state == .began
                return gestureIsActive
            }
        }
        
        set { }
    }
    
    var direction: TransitionDirection = .present
    
    @objc private func handle(recognizer r: UIPanGestureRecognizer) {
        switch direction {
        case .present:
            handlePresentation(recognizer: r)
        case .dismiss:
            handleDismiss(recognizer: r)
        }
    }
}

extension TransitionDriver {
    
    private func handlePresentation(recognizer r: UIPanGestureRecognizer) {
        switch r.state {
        case .began:
            pause()
        case .changed:
            let increment = r.incrementToLeft(maxTranslation: maxTranslation)
            update(percentComplete + increment)
            
        case .ended, .cancelled:
            if r.isEnoughToDismiss(maxTranslation: maxTranslation) {
                cancel()
            } else {
                finish()
            }
            
        case .failed:
            cancel()
            
        default:
            break
        }
    }
    
    private func handleDismiss(recognizer r: UIPanGestureRecognizer) {
        switch r.state {
        case .began:
            pause()
            if !isRunning {
                presentedController?.dismiss(animated: true)
            }
        
        case .changed:
            update(percentComplete + r.incrementToLeft(maxTranslation: maxTranslation))
            
        case .ended, .cancelled:
            if r.isEnoughToDismiss(maxTranslation: maxTranslation) {
                finish()
            } else {
                cancel()
            }

        case .failed:
            cancel()
            
        default:
            break
        }
    }
    
    var maxTranslation: CGFloat {
        return presentedController?.view.frame.width ?? 0
    }
    
    private var isRunning: Bool {
        return percentComplete != 0
    }
}

private extension UIPanGestureRecognizer {
    
    func isEnoughToDismiss(maxTranslation: CGFloat) -> Bool {
        let endLocation = projectedLocation(decelerationRate: .fast)
        let isPresentationCompleted = endLocation.x < maxTranslation / 2
        return isPresentationCompleted
    }
    
    // Completion percent
    func incrementToLeft(maxTranslation: CGFloat) -> CGFloat {
        let translation = self.translation(in: view).x
        setTranslation(.zero, in: nil)
        
        let percentIncrement = translation / maxTranslation
        return -percentIncrement
    }
}
