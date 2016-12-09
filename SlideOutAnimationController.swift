//
//  SlideOutAnimationController.swift
//  BookMark
//
//  Created by Joshua Kuehn on 5/19/16.
//  Copyright © 2016 Joshua Kuehn. All rights reserved.
//

import Foundation
import UIKit

class SlideOutAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.33
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    if let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) {
      let containerView = transitionContext.containerView
      let duration = transitionDuration(using: transitionContext)
      
      UIView.animate(withDuration: duration, animations: {
        fromView.center.y -= containerView.bounds.size.height
        fromView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }, completion: { finished in
          transitionContext.completeTransition(finished)
      })
    }
  }
}
