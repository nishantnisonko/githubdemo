//
//  SettingsStarViewCell.swift
//  GithubDemo
//
//  Created by Nishanko, Nishant on 4/6/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class SettingsStarViewCell: UITableViewCell {

    @IBOutlet weak var minimumStarsSlider: UISlider!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
