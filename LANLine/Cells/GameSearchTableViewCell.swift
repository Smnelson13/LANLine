//
//  GameSearchTableViewCell.swift
//  LANLine
//
//  Created by Shane Nelson on 10/9/18.
//  Copyright © 2018 Shane Nelson. All rights reserved.
//

import UIKit

class GameSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
