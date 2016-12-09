//
//  PopUpView.swift
//  BookMark
//
//  Created by Joshua Kuehn on 5/23/16.
//  Copyright © 2016 Joshua Kuehn. All rights reserved.
//

import UIKit

class PopUpView: UIView {
  
  let topLayer = CAShapeLayer()
  let title = UILabel()
  let artistNameLabel = UILabel()
  let timeLabel = UILabel()
  let qrCodeImageView = UIImageView()
  
  var artistName:String = "Artist Name" {
    didSet{
      configure()
    }
  }
  
  var time:String = "Time" {
    didSet {
      configure()
    }
  }

  
  override init(frame: CGRect) {
    super.init(frame: frame)

  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    drawTopBackgroundLayer(layer: topLayer)
    setup()
  }
  
  func configure() {
    artistNameLabel.text = artistName
    timeLabel.text = time
  }
  
  func setup() {
    
    title.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(title)
    title.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    title.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
    title.text = "Swiftly Pass"
    title.font = UIFont.systemFont(ofSize: 24, weight: UIFontWeightMedium)
    title.textColor = UIColor.white
    
    artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(artistNameLabel)
    artistNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
    artistNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 53).isActive = true
    artistNameLabel.textColor = UIColor.black
    artistNameLabel.font = UIFont.systemFont(ofSize: 21, weight: UIFontWeightRegular)
    
    timeLabel.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(timeLabel)
    timeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
    timeLabel.topAnchor.constraint(equalTo: self.artistNameLabel.bottomAnchor, constant: 2).isActive = true
    timeLabel.textColor = UIColor.black
    timeLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightLight)
    
    qrCodeImageView.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(qrCodeImageView)
    qrCodeImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
    qrCodeImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
    qrCodeImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
    qrCodeImageView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 8).isActive = true
    qrCodeImageView.contentMode = .scaleAspectFit
    qrCodeImageView.image = #imageLiteral(resourceName: "fakeQRCode")
    
  }
  
  func drawTopBackgroundLayer(layer: CAShapeLayer) {
    layer.path = UIBezierPath(roundedRect: CGRect(x: 0,y: 0,width: self.frame.width,height: 48), byRoundingCorners: [UIRectCorner.topLeft, UIRectCorner.topRight], cornerRadii: CGSize(width: 8, height: 8)).cgPath
    layer.fillColor = UIColor(red: 50/255, green: 177/255, blue: 54/255, alpha: 1.0).cgColor
    self.layer.addSublayer(layer)
  }


}

