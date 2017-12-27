//
//  SongsTableViewCell.swift
//  JSON_test
//
//  Created by 施馨檸 on 25/12/2017.
//  Copyright © 2017 施馨檸. All rights reserved.
//

import UIKit

class SongsTableViewCell: UITableViewCell {

    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var trackImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
