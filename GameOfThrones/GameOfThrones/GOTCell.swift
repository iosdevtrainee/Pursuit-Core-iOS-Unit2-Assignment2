//
//  GOTCell.swift
//  GameOfThrones
//
//  Created by J on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class GOTCell: UITableViewCell {
  @IBOutlet weak var gotImage: UIImageView!
  @IBOutlet weak var gotNameLabel: UILabel!
  @IBOutlet weak var gotAirDateLabel: UILabel!
  var summary: String!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
