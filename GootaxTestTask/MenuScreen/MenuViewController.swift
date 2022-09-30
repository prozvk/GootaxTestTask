//
//  MenuViewController.swift
//  GootaxTestTask
//
//  Created by MacPro on 30.09.2022.
//

import Foundation
import UIKit

class MenuViewController: UIViewController {
    
    let data = ["Оплата", "Мои адреса", "Мои заказы", "Избранное", "Новости", "Купоны", "О нас", "Пригласить друзей", "Настройки"]
    
    var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect())
        tableView.backgroundColor = .systemBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "menuCellId")
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    var userInfoView = UserInfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self

        setupLayout()
    }
    
    func setupLayout() {
        view.backgroundColor = .systemBackground
        view.addSubview(userInfoView)
        view.addSubview(tableView)
        
        userInfoView.layer.cornerRadius = 12
        userInfoView.layer.maskedCorners = [.layerMaxXMinYCorner]
        
        tableView.layer.cornerRadius = 12
        tableView.layer.maskedCorners = [.layerMaxXMaxYCorner]
        
        NSLayoutConstraint.activate([
            userInfoView.topAnchor.constraint(equalTo: view.topAnchor),
            userInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userInfoView.heightAnchor.constraint(equalToConstant: 107),
            
            tableView.topAnchor.constraint(equalTo: userInfoView.bottomAnchor, constant: 12),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.reuseIdentifier)!
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "menuCellId")! as UITableViewCell
            cell.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            cell.textLabel?.text = data[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
}
