//
//  CustomCell.swift
//  testLogin
//
//  Created by Kevin Koleck on 7/17/16.
//  Copyright © 2016 Kevin Koleck. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet var MajorLabel: UILabel!
    @IBOutlet var MinorLabel: UILabel!
    @IBOutlet var ButtonText: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
