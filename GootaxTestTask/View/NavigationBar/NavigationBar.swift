//
//  NavigationBar.swift
//  GootaxTestTask
//
//  Created by MacPro on 29.09.2022.
//

import Foundation
import UIKit

class NavigationBar: UIView {
    
    public weak var delegate: NavigationBarDelegate?
    
    public var address: String = "" {
        didSet {
            addressView.address = address
        }
    }
   
    private lazy var favofiteButton = FavoriteButton()
    
    private lazy var searchBar: SearchBar = {
        let view = SearchBar()
        view.placeholder = "Поиск Товаров"
        return view
    }()
    
    private lazy var addressView: AddressView = {
        let button = AddressView()
        button.addTarget(self, action: #selector(addressButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var menuButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(menuButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var menuButtonImage: UIView = {
        let view = UIImageView(image: UIImage(named: "menuButton"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    @objc private func addressButtonDidTap() {
        delegate?.presentAddressSearchController()
    }
    
    @objc private func menuButtonDidTap() {
        delegate?.presentMenuController()
    }
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemBackground
        setupLayout()
    }
    
    private func setupLayout() {
    
        menuButton.addSubview(menuButtonImage)
        NSLayoutConstraint.activate([
            menuButtonImage.centerYAnchor.constraint(equalTo: menuButton.centerYAnchor),
            menuButtonImage.centerXAnchor.constraint(equalTo: menuButton.centerXAnchor),
            menuButtonImage.widthAnchor.constraint(equalToConstant: 19),
            menuButtonImage.heightAnchor.constraint(equalToConstant: 17)
        ])
        
        addSubview(menuButton)
        addSubview(searchBar)
        addSubview(addressView)
        addSubview(favofiteButton)
        
        NSLayoutConstraint.activate([
            menuButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            menuButton.topAnchor.constraint(equalTo: topAnchor, constant: 27.5),
            menuButton.widthAnchor.constraint(equalToConstant: 30),
            menuButton.heightAnchor.constraint(equalToConstant: 30),
            
            favofiteButton.widthAnchor.constraint(equalToConstant: 30),
            favofiteButton.heightAnchor.constraint(equalToConstant: 30),
            favofiteButton.topAnchor.constraint(equalTo: topAnchor, constant: 82),
            favofiteButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            
            searchBar.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            searchBar.topAnchor.constraint(equalTo: topAnchor, constant: 79),
            searchBar.rightAnchor.constraint(equalTo: favofiteButton.leftAnchor, constant: -10),
            searchBar.heightAnchor.constraint(equalToConstant: 35),
            
            addressView.leftAnchor.constraint(equalTo: menuButton.rightAnchor, constant: 28),
            addressView.topAnchor.constraint(equalTo: topAnchor, constant: 27.5),
            addressView.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            addressView.heightAnchor.constraint(equalToConstant: 35.5),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
