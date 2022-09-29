//
//  SearchViewController + DataSource.swift
//  GootaxTestTask
//
//  Created by MacPro on 29.09.2022.
//

import UIKit

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: StaticSearchTableViewCell.reuseIdentifier) as! StaticSearchTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.reuseIdentifier) as! SearchTableViewCell
            let model = data[indexPath.row - 1].data!
            var text = (model.street ?? "") + " "
            text += (model.house ?? "") + " "
            text += (model.flat ?? "")
            
            var detail = (model.city ?? "")  + " "
            detail += (model.region ?? "") + " "
            detail += (model.country ?? "")
            
            cell.titleAddressLabel.text = text
            cell.detailAddressLabel.text = detail
            return cell
        }
    }
}
