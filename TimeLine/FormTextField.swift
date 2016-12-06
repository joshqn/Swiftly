//
//  FormTextField.swift
//  TimeLine
//
//  Created by Joshua Kuehn on 11/26/16.
//  Copyright © 2016 Joshua Kuehn. All rights reserved.
//

import UIKit

@IBDesignable
class FormTextField: UITextField {
  
  var bottomBorder = UIView()
  
  @IBInspectable var bottomBorderColor: UIColor = UIColor.lightGray {
    didSet {
      configure()
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    setup()
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
    self.addSubview(bottomBorder)
    bottomBorder.translatesAutoresizingMaskIntoConstraints = false
    bottomBorder.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    bottomBorder.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    bottomBorder.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    bottomBorder.heightAnchor.constraint(equalToConstant: 1).isActive = true
  }
  
  func configure() {
    bottomBorder.backgroundColor = bottomBorderColor
  }

}
