//
//  ViewController+TableView.swift
//  TableView
//
//  Created by Shivank Agarwal on 02/07/19.
//  Copyright © 2019 Shivank Agarwal. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource{
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: kCustomTableViewCellReuseId, for: indexPath) as! CustomTableViewCell
        cell.titleLabel.text = itemData[indexPath.row].item
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
