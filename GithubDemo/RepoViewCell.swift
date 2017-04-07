//
//  RepoViewCell.swift
//  GithubDemo
//
//  Created by Nishanko, Nishant on 4/5/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class RepoViewCell: UITableViewCell {

    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var forksCountLabel: UILabel!
    @IBOutlet weak var starsCountLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
