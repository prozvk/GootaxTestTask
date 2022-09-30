//
//  PromoCollectionViewCell.swift
//  GootaxTestTask
//
//  Created by MacPro on 28.09.2022.
//

import Foundation
import UIKit

class PromoCollectionViewCell: UICollectionViewCell {

    static var reuseIdentifier: String {
        return String(describing: PromoCollectionViewCell.self)
    }
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension PromoCollectionViewCell {
    func setupLayout() {
        addSubview(imageView)
        addSubview(titleLabel)

        let spacing = CGFloat(8)
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: spacing),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -spacing),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: spacing),
            imageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -spacing),
        ])
    }
}

