//
//  MainViewController + NavigationBarDelegate.swift
//  GootaxTestTask
//
//  Created by MacPro on 30.09.2022.
//

import UIKit

extension MainViewController: NavigationBarDelegate {
    func presentAddressSearchController() {
        let vc = SearchViewController { [weak self] (address) in
            self?.navigationBar.addressView.currentAddressLabel.text = address.value
        }
        let presenter = SearchPresenter(view: vc)
        vc.presenter = presenter
        present(vc, animated: true)
    }
    
    func presentMenuController() {
        let vc = MenuViewController()
        vc.transitioningDelegate = transition
        vc.modalPresentationStyle = .custom
        present(vc, animated: true)
    }
}
