//
//  ActivityTableCell.swift
//  TimeLine
//
//  Created by Joshua Kuehn on 12/8/16.
//  Copyright © 2016 Joshua Kuehn. All rights reserved.
//

import UIKit

class ActivityTableCell: UITableViewCell {

  @IBOutlet weak var artistImageView: UIImageView!
  
  @IBOutlet weak var artistNameLabel: UILabel!
  
  @IBOutlet weak var dateLabel: UILabel!
  
  @IBOutlet weak var timeLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    artistImageView.layer.masksToBounds = true 
    artistImageView.layer.cornerRadius = 5
    artistImageView.layer.shadowOffset = CGSize(width: 0, height: 1)
    artistImageView.layer.shadowRadius = 2
    artistImageView.layer.shadowColor = UIColor.black.cgColor
    artistImageView.layer.shadowOpacity = 0.5
  }

}
