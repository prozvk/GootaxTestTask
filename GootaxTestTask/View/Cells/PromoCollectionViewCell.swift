//
//  PromoCollectionViewCell.swift
//  GootaxTestTask
//
//  Created by MacPro on 28.09.2022.
//

import Foundation
import UIKit

class PromoCollectionViewCell: UICollectionViewCell {
    
    func configure<T>(model: T) {
        guard let model = model as? PromoItem else { return }
        
        titleLabel.text = model.name
        imageView.image = model.image
    }

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
        label.adjustsFontForContentSizeCategory = true
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
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)

        let spacing = CGFloat(10)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: spacing),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -spacing),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: spacing),
            imageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, constant: -spacing),

            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: spacing),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
    }
}

