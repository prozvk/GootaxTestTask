//
//  NavigationBar.swift
//  GootaxTestTask
//
//  Created by MacPro on 29.09.2022.
//

import Foundation
import UIKit

class NavigationBar: UIView {
    
    var delegate: SearchDelegate!
    
    let button: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(addressButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Search", for: .normal)
        return button
    }()
    
    let menuButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(menuButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let menuButtonImage: UIView = {
        let view = UIImageView(image: UIImage(named: "menuButton"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let searchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = " Поиск товаров"
        label.textColor = UIColor.searchBarText
        label.layer.backgroundColor = UIColor.searchBar.cgColor
        label.layer.cornerRadius = 4
        return label
    }()
    
    
    
    @objc func addressButtonDidTap() {
        delegate.present()
    }
    
    @objc func menuButtonDidTap() {
        print("OPEN MENU")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupLayout()
    }
    
    func setupLayout() {
        
        menuButton.addSubview(menuButtonImage)
        NSLayoutConstraint.activate([
            menuButtonImage.centerYAnchor.constraint(equalTo: menuButton.centerYAnchor),
            menuButtonImage.centerXAnchor.constraint(equalTo: menuButton.centerXAnchor),
            menuButtonImage.widthAnchor.constraint(equalToConstant: 19),
            menuButtonImage.heightAnchor.constraint(equalToConstant: 17)
        ])
        
        addSubview(button)
        addSubview(menuButton)
        addSubview(searchLabel)
        
        NSLayoutConstraint.activate([
            menuButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 18),
            menuButton.topAnchor.constraint(equalTo: topAnchor, constant: 36.5),
            menuButton.widthAnchor.constraint(equalToConstant: 19),
            menuButton.heightAnchor.constraint(equalToConstant: 17),

            
            button.centerYAnchor.constraint(equalTo: centerYAnchor),
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            searchLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            searchLabel.topAnchor.constraint(equalTo: topAnchor, constant: 79),
            searchLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -55),
            searchLabel.heightAnchor.constraint(equalToConstant: 35),
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
