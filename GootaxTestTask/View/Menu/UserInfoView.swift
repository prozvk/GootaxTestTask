//
//  UserInfoView.swift
//  GootaxTestTask
//
//  Created by MacPro on 30.09.2022.
//

import UIKit

class UserInfoView: UIView {
    
    let avatarView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "user"))
        view.layer.cornerRadius = 28
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.backgroundColor = UIColor.green.cgColor
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.text = "Иван Иванов"
        return label
    }()
    
    let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.text = "+7 912 513-32-20"
        return label
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.separatorColor
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        self.translatesAutoresizingMaskIntoConstraints = false
        setupLayout()
    }
    
    func setupLayout() {
        addSubview(avatarView)
        addSubview(nameLabel)
        addSubview(phoneNumberLabel)
        addSubview(separatorView)
        
        NSLayoutConstraint.activate([
            avatarView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            avatarView.topAnchor.constraint(equalTo: topAnchor, constant: 35),
            avatarView.widthAnchor.constraint(equalToConstant: 56),
            avatarView.heightAnchor.constraint(equalToConstant: 56),
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 104),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 41),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            phoneNumberLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            phoneNumberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            phoneNumberLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            phoneNumberLabel.heightAnchor.constraint(equalToConstant: 20),
            
            separatorView.leftAnchor.constraint(equalTo: leftAnchor),
            separatorView.rightAnchor.constraint(equalTo: rightAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
