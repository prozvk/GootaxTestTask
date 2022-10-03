//
//  MenuTableViewCell.swift
//  GootaxTestTask
//
//  Created by MacPro on 30.09.2022.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    public var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    public var numberOfCard: String = "" {
        didSet {
            cardNumber.text = numberOfCard
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private lazy var cardNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.secondaryText1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titleLabel)
        addSubview(cardNumber)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            cardNumber.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            cardNumber.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            cardNumber.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            cardNumber.heightAnchor.constraint(equalToConstant: 20),
            
            heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
