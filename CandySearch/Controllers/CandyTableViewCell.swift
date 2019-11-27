//
//  CandyTableViewCell.swift
//  CandySearch
//
//  Created by Mahmoud El-Melligy on 11/25/19.
//  Copyright © 2019 Mahmoud El-Melligy. All rights reserved.
//

import UIKit

class CandyTableViewCell: UITableViewCell {
    @IBOutlet weak var candyNameLabel: UILabel!
    @IBOutlet weak var candyCategoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
