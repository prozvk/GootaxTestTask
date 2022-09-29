//
//  SearchViewController + TableViewDelegate.swift
//  GootaxTestTask
//
//  Created by MacPro on 29.09.2022.
//

import UIKit

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0 {
            let address = data[indexPath.row - 1]
            onChange(address)
        }
        dismiss(animated: true)
    }
}
