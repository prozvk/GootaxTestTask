//
//  SearchBar.swift
//  GootaxTestTask
//
//  Created by MacPro on 30.09.2022.
//

import UIKit

class SearchBar: UIView {
    
    let searchView: UIView = {
        let label = UIView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.searchBar
        label.layer.cornerRadius = 4
        return label
    }()
    
    let searchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Поиск товаров"
        label.textColor = UIColor.secondaryText1
        return label
    }()
    
    let searchImage: UIView = {
        let view = UIImageView(image: UIImage(named: "search"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    
    init() {
        super.init(frame: CGRect())
        self.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(searchView)
        NSLayoutConstraint.activate([
            searchView.leftAnchor.constraint(equalTo: leftAnchor),
            searchView.topAnchor.constraint(equalTo: topAnchor),
            searchView.bottomAnchor.constraint(equalTo: bottomAnchor),
            searchView.rightAnchor.constraint(equalTo: rightAnchor),
        ])
        
        addSubview(searchImage)
        addSubview(searchLabel)
        
        NSLayoutConstraint.activate([
            searchImage.rightAnchor.constraint(equalTo: searchView.rightAnchor, constant: -10),
            searchImage.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            searchImage.widthAnchor.constraint(equalToConstant: 15),
            searchImage.heightAnchor.constraint(equalToConstant: 15),
            
            searchLabel.leftAnchor.constraint(equalTo: searchView.leftAnchor, constant: 10),
            searchLabel.topAnchor.constraint(equalTo: searchView.topAnchor, constant: 5),
            searchLabel.bottomAnchor.constraint(equalTo: searchView.bottomAnchor, constant: -5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
