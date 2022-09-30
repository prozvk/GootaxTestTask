//
//  FavouriteButton.swift
//  GootaxTestTask
//
//  Created by MacPro on 30.09.2022.
//

import UIKit

class FavoriteButton: UIButton {
    
    let favoriteButtonImage: UIView = {
        let view = UIImageView(image: UIImage(named: "favoriteButton"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    init() {
        super.init(frame: CGRect())
        self.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(favoriteButtonImage)

        NSLayoutConstraint.activate([
            favoriteButtonImage.leftAnchor.constraint(equalTo: leftAnchor),
            favoriteButtonImage.topAnchor.constraint(equalTo: topAnchor),
            favoriteButtonImage.rightAnchor.constraint(equalTo: rightAnchor),
            favoriteButtonImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
