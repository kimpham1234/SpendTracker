//
//  DayTableViewCell.swift
//  SpendTracker
//
//  Created by Kim Pham on 8/21/16.
//  Copyright © 2016 BooBoo. All rights reserved.
//

import UIKit

class DayTableViewCell: UITableViewCell {

    //MARK: Properties
    
    @IBOutlet weak var dayLabel: UILabel!
    
    @IBOutlet weak var dayTotal: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
