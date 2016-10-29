//
//  ItemTableViewCell.swift
//  VRN_Guide
//
//  Created by Надежда on 29.10.16.
//  Copyright © 2016 PTeam. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    //MARK - properties
    
    @IBOutlet weak var ItemContext: UILabel!
    @IBOutlet weak var ItemName: UILabel!
    @IBOutlet weak var ItemPhoto: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
    
    
    

}
