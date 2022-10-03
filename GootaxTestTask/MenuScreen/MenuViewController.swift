//
//  MenuViewController.swift
//  GootaxTestTask
//
//  Created by MacPro on 30.09.2022.
//

import Foundation
import UIKit

class MenuViewController: UIViewController {
    
    private let data = ["Оплата", "Мои адреса", "Мои заказы", "Избранное", "Новости", "Купоны", "О нас", "Пригласить друзей", "Настройки"]
    
    private lazy var userInfoView: UserInfoView = {
        let view = UserInfoView()
        view.image = UIImage(named: "user")!
        view.name = "Иван Иванов"
        view.phoneNumber = "+7 800 555-35-35"
        view.layer.cornerRadius = 12
        view.layer.maskedCorners = [.layerMaxXMinYCorner]
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect())
        tableView.backgroundColor = .systemBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "menuCellId")
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.layer.cornerRadius = 12
        tableView.layer.maskedCorners = [.layerMaxXMaxYCorner]
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self

        setupLayout()
    }
    
    private func setupLayout() {
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 12
        view.addSubview(userInfoView)
        view.addSubview(tableView)

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
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.reuseIdentifier) as! MenuTableViewCell
            cell.numberOfCard = "Карта *4567"
            cell.title = "Оплата"
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "menuCellId")!
            cell.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            cell.textLabel?.text = data[indexPath.row]
            return cell
        }
    }
}
