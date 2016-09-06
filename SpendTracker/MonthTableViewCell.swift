//
//  MonthTableViewCell.swift
//  SpendTracker
//
//  Created by Kim Pham on 8/30/16.
//  Copyright © 2016 BooBoo. All rights reserved.
//

import UIKit

class MonthTableViewCell: UITableViewCell {

    @IBOutlet weak var monthLabel: UILabel!
    
    @IBOutlet weak var monthTotalLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
