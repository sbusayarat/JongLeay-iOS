//
//  ShopTableViewCell.swift
//  JongLeoyApp
//
//  Created by Jessica Chayavichitsilp on 1/17/16.
//  Copyright © 2016 Jessica Chayavichitsilp. All rights reserved.
//

import UIKit

class ShopTableViewCell: UITableViewCell {
    
    @IBOutlet weak var shopImageView: UIImageView!
    @IBOutlet weak var shopNameLabel: UILabel!
    @IBOutlet weak var shopAddressLabel: UILabel!
    @IBOutlet weak var queueButton: UIButton!
    @IBOutlet weak var categoryLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
