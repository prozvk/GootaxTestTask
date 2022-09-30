//
//  AddressView.swift
//  GootaxTestTask
//
//  Created by MacPro on 30.09.2022.
//

import UIKit

class AddressView: UIButton {
    
    let deliveryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "Доставка"
        label.textColor = UIColor.secondaryText1
        return label
    }()
    
    let currentAddressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Воткинское шоссе, 12"
        return label
    }()
    
    let arrowImage: UIView = {
        let view = UIImageView(image: UIImage(named: "downArrow"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    
    init() {
        super.init(frame: CGRect())
        self.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(deliveryLabel)
        addSubview(currentAddressLabel)
        addSubview(arrowImage)
        
        
        NSLayoutConstraint.activate([
            deliveryLabel.leftAnchor.constraint(equalTo: leftAnchor),
            deliveryLabel.topAnchor.constraint(equalTo: topAnchor),
            deliveryLabel.rightAnchor.constraint(equalTo: rightAnchor),
            deliveryLabel.heightAnchor.constraint(equalToConstant: 20),
            
            currentAddressLabel.leftAnchor.constraint(equalTo: leftAnchor),
//            currentAddressLabel.rightAnchor.constraint(equalTo: rightAnchor),
            currentAddressLabel.heightAnchor.constraint(equalToConstant: 20),
            currentAddressLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            arrowImage.leftAnchor.constraint(equalTo: currentAddressLabel.rightAnchor, constant: 6),
//            arrowImage.rightAnchor.constraint(equalTo: rightAnchor),
            arrowImage.heightAnchor.constraint(equalToConstant: 6),
            arrowImage.widthAnchor.constraint(equalToConstant: 10),
            arrowImage.centerYAnchor.constraint(equalTo: currentAddressLabel.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
