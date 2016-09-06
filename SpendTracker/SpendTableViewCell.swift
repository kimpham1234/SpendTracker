//
//  SpendTableViewCell.swift
//  SpendTracker
//
//  Created by Kim Pham on 8/15/16.
//  Copyright © 2016 BooBoo. All rights reserved.
//

import UIKit

class SpendTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var itemStatusLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
