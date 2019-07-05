//
//  CustomTableViewCell.swift
//  DiffableDataSource
//
//  Created by Shivank Agarwal on 19/06/19.
//  Copyright © 2019 Shivank Agarwal. All rights reserved.
//

import UIKit

let kCustomTableViewCellReuseId = "kCustomTableViewCellReuseId"

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
