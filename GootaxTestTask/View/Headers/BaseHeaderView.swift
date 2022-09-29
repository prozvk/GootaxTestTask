//
//  DiscountHeaderView.swift
//  GootaxTestTask
//
//  Created by MacPro on 29.09.2022.
//

import Foundation
import UIKit

class BaseHeaderView: UICollectionReusableView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    var label: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .black
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 25)
        label.sizeToFit()
        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        label.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        addSubview(label)
//
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
//        label.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//   }

   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
}