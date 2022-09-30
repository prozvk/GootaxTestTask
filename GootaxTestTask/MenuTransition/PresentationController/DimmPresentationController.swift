//
//  DimmPresentationController.swift
//  GootaxTestTask
//
//  Created by MacPro on 30.09.2022.
//

import UIKit

/// Этот класс затемняет фон при анимации
/// Он наследуется от PresentationController
class DimmPresentationController: PresentationController {
    
    //перед началом показа
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        
        containerView?.insertSubview(dimmView, at: 0)
        
        
        performAlongsideTransitionIfPossible { [unowned self] in
            self.dimmView.alpha = 1
        }
    }
    
    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        
        dimmView.frame = containerView!.frame
    }
    
    //Анимация может быть прервана и отменена, и если отменили, то надо удалить dimmView из иерархии
    override func presentationTransitionDidEnd(_ completed: Bool) {
        super.presentationTransitionDidEnd(completed)
        
        if !completed {
            self.dimmView.removeFromSuperview()
        }
    }
    
    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        
        performAlongsideTransitionIfPossible { [unowned self] in
            self.dimmView.alpha = 0
        }
    }
    
    //Если при анимации скрытия(completed = false) поймают вьюху то dimm убирать не надо
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        super.dismissalTransitionDidEnd(completed)
        
        print("did end dismissing", completed)
        if completed {
            self.dimmView.removeFromSuperview()
        }
    }
    
    //Метод для анимации описанной в блоке
    private func performAlongsideTransitionIfPossible(_ block: @escaping () -> Void) {
        guard let coordinator = self.presentedViewController.transitionCoordinator else {
            block()
            return
        }
            
        coordinator.animate(alongsideTransition: { (_) in
            block()
        }, completion: nil)
    }
    
    private lazy var dimmView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.3)
        view.alpha = 0
        return view
    }()
}
