//
//  DiscountHeaderView.swift
//  GootaxTestTask
//
//  Created by MacPro on 29.09.2022.
//

import Foundation
import UIKit

class DiscountHeaderView: BaseHeaderView {
    
    let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.957, green: 0.957, blue: 0.957, alpha: 1)
        view.layer.cornerRadius = 15
        return view
    }()
    
    let arrowView: UIView = {
        let view = UIImageView(image: UIImage(named: "arrow"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    var button: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.backgroundColor = UIColor(red: 0.957, green: 0.957, blue: 0.957, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "Смотреть все"
        label.textAlignment = .center
        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let spacing: CGFloat = 10
        view.addSubview(button)
        view.addSubview(arrowView)

        NSLayoutConstraint.activate([
            arrowView.topAnchor.constraint(equalTo: view.topAnchor, constant: spacing),
            arrowView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -spacing),
            arrowView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -spacing),
            arrowView.widthAnchor.constraint(equalToConstant: spacing),
            arrowView.heightAnchor.constraint(equalTo: arrowView.widthAnchor),

            button.leftAnchor.constraint(equalTo: view.leftAnchor,constant: spacing),
            button.topAnchor.constraint(equalTo: view.topAnchor),
            button.rightAnchor.constraint(equalTo: arrowView.leftAnchor, constant: -spacing/2),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        addSubview(view)
//        view.widthAnchor.constraint(equalToConstant: 103).isActive = true
//        view.heightAnchor.constraint(equalToConstant: 25).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        

    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
}
