//
//  SalesCollectionViewCell.swift
//  GootaxTestTask
//
//  Created by MacPro on 28.09.2022.
//

import Foundation
import UIKit

class DiscountCollectionViewCell: UICollectionViewCell, ReusableItem {
    
    static var reuseIdentifier: String {
        return String(describing: DiscountCollectionViewCell.self)
    }
    
    let saleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.layer.backgroundColor = UIColor.red.cgColor
        label.layer.cornerRadius = 10
        label.textColor = .white
        label.textAlignment = .center
        label.text = "-35%"
        return label
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 3
        return label
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.443, green: 0.443, blue: 0.443, alpha: 1)
        label.sizeToFit()
        return label
    }()
    
    let addImage: UIView = {
        let view = UIImageView(image: UIImage(named: "addImage"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 1, green: 0.827, blue: 0.204, alpha: 1)
        button.layer.cornerRadius = 15
        return button
    }()
    
    let oldPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "600 ₽")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSRange(location: 0, length: attributeString.length))
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 1, green: 0.259, blue: 0.192, alpha: 1)
        label.attributedText = attributeString
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "390 ₽"
        return label
    }()
    
    override func layoutSubviews() {
        backgroundColor = UIColor(red: 0.957, green: 0.957, blue: 0.957, alpha: 1)
        layer.cornerRadius = 12
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension DiscountCollectionViewCell {
    func setupLayout() {
        
        addButton.addSubview(addImage)
        NSLayoutConstraint.activate([
            addImage.widthAnchor.constraint(equalToConstant: 15),
            addImage.heightAnchor.constraint(equalTo: addImage.widthAnchor),
            addImage.centerYAnchor.constraint(equalTo: addButton.centerYAnchor),
            addImage.centerXAnchor.constraint(equalTo: addButton.centerXAnchor),
        ])
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(saleLabel)
        contentView.addSubview(weightLabel)
        contentView.addSubview(addButton)
        contentView.addSubview(priceLabel)
        contentView.addSubview(oldPriceLabel)

        let spacing = CGFloat(5)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),

            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: spacing),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: spacing),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -spacing),
            
            saleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: spacing),
            saleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: spacing),
            saleLabel.heightAnchor.constraint(equalToConstant: 20),
            saleLabel.widthAnchor.constraint(equalToConstant: 40),
            
            weightLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: spacing),
            weightLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: spacing),
            
            addButton.heightAnchor.constraint(equalToConstant: 30),
            addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor),
            addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -spacing),
            addButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -spacing),
            
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: spacing),
            priceLabel.rightAnchor.constraint(equalTo: addButton.leftAnchor, constant: -spacing),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -spacing),
            priceLabel.heightAnchor.constraint(equalToConstant: 20),
            
            oldPriceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: spacing),
            oldPriceLabel.rightAnchor.constraint(equalTo: addButton.leftAnchor, constant: -spacing),
            oldPriceLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor),
            oldPriceLabel.heightAnchor.constraint(equalToConstant: 16),
        ])
    }
}
