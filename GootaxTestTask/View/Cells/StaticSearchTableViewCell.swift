//
//  StaticSearchTableViewCell.swift
//  GootaxTestTask
//
//  Created by MacPro on 29.09.2022.
//

import UIKit

class StaticSearchTableViewCell: UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: StaticSearchTableViewCell.self)
    }
    
    let titleAddressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Текущее местоположение"
        return label
    }()
    
    let addressImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "currentLocation"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(addressImage)
        addSubview(titleAddressLabel)
        
        NSLayoutConstraint.activate([
            addressImage.widthAnchor.constraint(equalToConstant: 20),
            addressImage.heightAnchor.constraint(equalToConstant: 20),
            addressImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 17),
            addressImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            titleAddressLabel.leftAnchor.constraint(equalTo: addressImage.rightAnchor, constant: 18),
            titleAddressLabel.heightAnchor.constraint(equalToConstant: 20),
            titleAddressLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -17),
            titleAddressLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
