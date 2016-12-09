//
//  AvatarView.swift
//  TimeLine
//
//  Created by Joshua Kuehn on 11/20/16.
//  Copyright © 2016 Joshua Kuehn. All rights reserved.
//

import UIKit

@IBDesignable
class AvatarView: UIView {

  let margin:CGFloat = 60.0
  let layerAvatar = CAShapeLayer()
  let concertsLabel = UILabel()
  let hoursLabel = UILabel()
  let historyLabel = UILabel()
  let nameLabel = UILabel()
  let layerGradiest = CAGradientLayer()
  let bottomBorder = UIView()
  
  @IBInspectable var bottomBarColor: UIColor = UIColor.lightGray {
    didSet {
      configure()
    }
  }
  
  @IBInspectable var strokeColor: UIColor = UIColor.black {
    didSet {
      configure()
    }
  }
  
  @IBInspectable var startColor: UIColor = UIColor.white {
    didSet {
      configure()
    }
  }
  
  @IBInspectable var endColor: UIColor = UIColor.black {
    didSet {
      configure()
    }
  }
  
  @IBInspectable var nameColor:UIColor = UIColor.black {
    didSet {
      configure()
    }
  }
  
  @IBInspectable var imageAvatar: UIImage? {
    didSet {
      configure()
    }
  }
  
  @IBInspectable var name:String = "First Last" {
    didSet {
      configure()
    }
  }
  
  @IBInspectable var hours = 1.5 {
    didSet {
      configure()
    }
  }
  
  @IBInspectable var concerts = 4 {
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
  
  //One time setup is done here
  func setup() {
    
    //Setup Gradient
    layer.addSublayer(layerGradiest)
    
    layerAvatar.fillColor = nil
    layerAvatar.lineWidth = 10.0
    layerAvatar.contentsGravity = kCAGravityResizeAspectFill
    layer.addSublayer(layerAvatar)
    
    //Setup hoursLabel
    hoursLabel.translatesAutoresizingMaskIntoConstraints = false
    hoursLabel.numberOfLines = 0
    hoursLabel.textAlignment = .center
    self.addSubview(hoursLabel)
    
    //Setup hoursLabel Constraints
    let hourstrailing = hoursLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
    let hoursBottom = hoursLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -45)
    NSLayoutConstraint.activate([hourstrailing,hoursBottom])
    
    //Setup concertsLabel
    concertsLabel.translatesAutoresizingMaskIntoConstraints = false
    concertsLabel.numberOfLines = 0
    concertsLabel.textAlignment = .center
    self.addSubview(concertsLabel)
    
    //Setup concertsLabel Constraints
    let concertsLeading = concertsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
    let concertsBottom = concertsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -45)
    NSLayoutConstraint.activate([concertsLeading,concertsBottom])
    
    //Setup historyLabel
    historyLabel.translatesAutoresizingMaskIntoConstraints = false
    historyLabel.textAlignment = .center
    historyLabel.font = UIFont.systemFont(ofSize: 20)
    historyLabel.textColor = UIColor.black
    historyLabel.text = "History"
    self.addSubview(historyLabel)
    
    //Setup historyLabel Constraints
    let historyBottom = historyLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2)
    let historyCenterX = historyLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
    NSLayoutConstraint.activate([historyBottom,historyCenterX])
    
    //Setup BottomBorder Layout
    self.addSubview(bottomBorder)
    bottomBorder.translatesAutoresizingMaskIntoConstraints = false
    bottomBorder.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20).isActive = true
    bottomBorder.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    bottomBorder.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    bottomBorder.heightAnchor.constraint(equalToConstant: 1).isActive = true
    
    //Setup nameLabel Constraints
    self.addSubview(nameLabel)
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true
    
    //Setup nameLabel
    nameLabel.textAlignment = .center
    nameLabel.font = UIFont.systemFont(ofSize: 26)
    
  }
  
  func configure() {
    // Configure image view and label
    layerAvatar.contents = imageAvatar?.cgImage
    layerAvatar.strokeColor = strokeColor.cgColor
    
    //Configure Gradient
    layerGradiest.colors = [startColor.cgColor, endColor.cgColor]
    layerGradiest.startPoint = CGPoint(x: 0.5, y: 0)
    layerGradiest.endPoint = CGPoint(x: 0.5, y: 1)
    
    hoursLabel.text = "Total Hours\nSaved:\n \(hours)"
    concertsLabel.text = "Total\nConcerts:\n \(concerts)"
    
    bottomBorder.backgroundColor = bottomBarColor
    
    nameLabel.text = name
    nameLabel.textColor = nameColor
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    let layerAvatarHeight = self.bounds.height - margin - 10
    layerAvatar.frame = CGRect(x: self.bounds.width/2 - layerAvatarHeight/2, y: 10, width: layerAvatarHeight, height: layerAvatarHeight)
    let maskLayer = CAShapeLayer()
    maskLayer.path = UIBezierPath(ovalIn: layerAvatar.bounds).cgPath
    layerAvatar.mask = maskLayer
    layerAvatar.path = maskLayer.path
    
    
    //Gradient
    layerGradiest.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: layerAvatar.frame.midY)
  }

}
