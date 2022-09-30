//
//  PresentationController.swift
//  GootaxTestTask
//
//  Created by MacPro on 30.09.2022.
//

import UIKit

class PresentationController: UIPresentationController {
    
    override var shouldPresentInFullscreen: Bool {
        return false
    }
    
    // finalFrame in PresentAnimation
    override var frameOfPresentedViewInContainerView: CGRect {
        let bounds = containerView!.bounds
        return CGRect(x: 0, y: 0, width: bounds.width - 38, height: bounds.height)
    }
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        
        containerView?.addSubview(presentedView!)
    }
    
    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
    var driver: TransitionDriver!
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        super.presentationTransitionDidEnd(completed)
        
        if completed {
            driver.direction = .dismiss
        }
    }
}
