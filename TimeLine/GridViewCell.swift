//
//  GridViewCell.swift
//  TimeLine
//
//  Created by Joshua Kuehn on 12/3/16.
//  Copyright © 2016 Joshua Kuehn. All rights reserved.
//

import UIKit

class GridViewCell: UICollectionViewCell {
  
  @IBOutlet weak var imageView: UIImageView!
  
  var representedAssetIdentifier: String!
  
  var thumbnailImage: UIImage = UIImage() {
    didSet {
      imageView.image = thumbnailImage
    }
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    //imageView.image = nil
  }
  
}
