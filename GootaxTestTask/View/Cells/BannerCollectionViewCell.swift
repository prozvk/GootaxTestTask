//
//  BannerCollectionViewCell.swift
//  GootaxTestTask
//
//  Created by MacPro on 28.09.2022.
//

import Foundation
import UIKit

class BannerCollectionViewCell: UICollectionViewCell {

    static var reuseIdentifier: String {
        return String(describing: BannerCollectionViewCell.self)
    }
    
    let bannerImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        return image
    }()
    
    override func layoutSubviews() {
        contentView.backgroundColor = .gray
        contentView.layer.cornerRadius = 12
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension BannerCollectionViewCell {
    func setupLayout() {
        contentView.addSubview(bannerImageView)

        NSLayoutConstraint.activate([
            bannerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bannerImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bannerImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
