//
//  ProfilePicView.swift
//  TimeLine
//
//  Created by Joshua Kuehn on 12/2/16.
//  Copyright © 2016 Joshua Kuehn. All rights reserved.
//

import UIKit

@IBDesignable
class ProfilePicView: UIView {
  
  let layerAvatar = CAShapeLayer()
  
  @IBInspectable var strokeColor: UIColor = UIColor.white {
    didSet {
      configure()
    }
  }
  
  @IBInspectable var imageAvatar: UIImage? {
    didSet {
      configure()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setup()
  }
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setup()
  }

  func setup() {
    self.backgroundColor = UIColor.clear
    
    layerAvatar.fillColor = nil
    layerAvatar.lineWidth = 10.0
    layerAvatar.contentsGravity = kCAGravityResizeAspectFill
    layer.addSublayer(layerAvatar)
  }
  
  func configure() {
    // Configure image view and label
    layerAvatar.contents = imageAvatar?.cgImage
    layerAvatar.strokeColor = strokeColor.cgColor
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    let layerAvatarHeight = self.bounds.height
    layerAvatar.frame = CGRect(x: 0, y: 0, width: layerAvatarHeight, height: layerAvatarHeight)
    let maskLayer = CAShapeLayer()
    maskLayer.path = UIBezierPath(ovalIn: layerAvatar.bounds).cgPath
    layerAvatar.mask = maskLayer
    layerAvatar.path = maskLayer.path
    
  }

}
