//
//  BouneAnimationController.swift
//  BookMark
//
//  Created by Joshua Kuehn on 5/19/16.
//  Copyright © 2016 Joshua Kuehn. All rights reserved.
//

import Foundation
import UIKit

class BounceAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
  
  
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.6
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    if let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to), let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) {
      
      let containerView = transitionContext.containerView
      toView.frame = transitionContext.finalFrame(for: toViewController)
      containerView.addSubview(toView)
      
      let transform = makePerspectiveTransform()
      
      //var transformRotate = self.makePerspectiveTransform()
      var transformScale = self.makePerspectiveTransform()
      
     // transformRotate = CATransform3DRotate(transform, CGFloat(-M_PI/2), 0, 1, 0)
      transformScale = CATransform3DScale(transform, 0.6, 0.6, 1.0)
      //var concat = CATransform3DConcat(transformRotate, transformScale)
      
      toView.layer.transform = transformScale
      
      //transformRotate = CATransform3DRotate(transform, 0, 0, 1, 0)
      transformScale = CATransform3DScale(transform, 1.0, 1.0, 1.0)
      //concat = CATransform3DConcat(transformRotate, transformScale)
      //transform = CATransform3DTranslate(transform, -0.7 * 100, 0, 0)
      
      toView.layer.zPosition = 120
      toView.center.y = -toView.frame.height
      
      UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.1, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
        toView.layer.transform = transformScale
        toView.center.y = toViewController.view.frame.height/2
        }, completion: { finished in
          transitionContext.completeTransition(finished)

      })
      
//      UIView.animateKeyframesWithDuration(transitionDuration(transitionContext), delay: 0.1, options: .CalculationModeCubic, animations: {
//        UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 1.0, animations: {
//          
//          toView.layer.transform = transformScale
//          toView.center.y = toViewController.view.frame.height/2
//          
//        })
//        }, completion: { finished in
//          transitionContext.completeTransition(finished)
//      })
      
    }
  }
  
  func makePerspectiveTransform() -> CATransform3D {
    var transform = CATransform3DIdentity
    transform.m34 = 1.0 / (-2000)
    return transform
  }
  
  
  
}
