//
//  SearchTableViewCell.swift
//  GootaxTestTask
//
//  Created by MacPro on 29.09.2022.
//

import Foundation
import UIKit

class SearchTableViewCell: UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: SearchTableViewCell.self)
    }
    
    let titleAddressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let detailAddressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.tintColor = UIColor.searchDetailLabelFont
        return label
    }()
    
    let addressImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "address"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(addressImage)
        addSubview(titleAddressLabel)
        addSubview(detailAddressLabel)
        
        NSLayoutConstraint.activate([
            addressImage.widthAnchor.constraint(equalToConstant: 20),
            addressImage.heightAnchor.constraint(equalToConstant: 20),
            addressImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 17),
            addressImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            titleAddressLabel.leftAnchor.constraint(equalTo: addressImage.rightAnchor, constant: 18),
            titleAddressLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleAddressLabel.heightAnchor.constraint(equalToConstant: 20),
            titleAddressLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -17),
            
            detailAddressLabel.leftAnchor.constraint(equalTo: titleAddressLabel.leftAnchor),
            detailAddressLabel.heightAnchor.constraint(equalToConstant: 20),
            detailAddressLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -17),
            detailAddressLabel.topAnchor.constraint(equalTo: titleAddressLabel.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
