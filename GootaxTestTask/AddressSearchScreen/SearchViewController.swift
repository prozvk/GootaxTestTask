//
//  SearchViewController.swift
//  GootaxTestTask
//
//  Created by MacPro on 29.09.2022.
//

import Foundation
import UIKit

protocol SearchViewProtocol: class {
    func reloadData(addresses: [Address])
}

class SearchViewController: UIViewController, SearchViewProtocol {
    
    var presenter: SearchPresenterProtocol!
    var tableView: UITableView!
    var data: [Address] = []
    var onChange: (Address) -> ()
    
    let searchImage: UIView = {
        let view = UIImageView(image: UIImage(named: "search"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let deleteImage: UIView = {
        let view = UIImageView(image: UIImage(named: "delete"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let textfield: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Введите адрес"
        tf.font?.withSize(17)
        tf.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.separatorColor
        return view
    }()
    
    init(onChange: @escaping (Address) -> ()) {
        self.onChange = onChange
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.reuseIdentifier)
        tableView.register(StaticSearchTableViewCell.self, forCellReuseIdentifier: StaticSearchTableViewCell.reuseIdentifier)
        
        view.backgroundColor = .white
        
        setupLayout()
    }
    
    func reloadData(addresses: [Address]) {
        data = addresses
        tableView.reloadData()
    }
    
    @objc func textFieldDidChange(_ textView: UITextView) {
        if textView.text.count > 1 || textView.text.count == 0 {
            presenter.fetchAddresses(text: textView.text)
        }
    }
}

// MARK: - Layout
    
extension SearchViewController {

    func setupLayout() {
        view.addSubview(textfield)
        view.addSubview(separatorView)
        view.addSubview(searchImage)
        view.addSubview(deleteImage)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            searchImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            searchImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 26),
            searchImage.widthAnchor.constraint(equalToConstant: 20),
            searchImage.heightAnchor.constraint(equalToConstant: 20),
            
            deleteImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            deleteImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 31.5),
            deleteImage.widthAnchor.constraint(equalToConstant: 12),
            deleteImage.heightAnchor.constraint(equalTo: deleteImage.widthAnchor),
            
            textfield.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            textfield.leftAnchor.constraint(equalTo: searchImage.rightAnchor, constant: 19),
            textfield.rightAnchor.constraint(equalTo: deleteImage.leftAnchor, constant: -19),
            textfield.heightAnchor.constraint(equalToConstant: 50),
            
            separatorView.topAnchor.constraint(equalTo: textfield.bottomAnchor),
            separatorView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            separatorView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            
            tableView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
