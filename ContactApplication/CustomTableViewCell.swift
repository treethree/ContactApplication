//
//  CustomTableViewCell.swift
//  ContactApplication
//
//  Created by SHILEI CUI on 3/19/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell{

    @IBOutlet weak var txtField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
