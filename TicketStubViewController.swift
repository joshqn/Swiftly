//
//  TicketStubViewController.swift
//  TimeLine
//
//  Created by Joshua Kuehn on 12/9/16.
//  Copyright © 2016 Joshua Kuehn. All rights reserved.
//

import UIKit

class TicketStubViewController: UIViewController {
  
  let popUpView = PopUpView()
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    modalPresentationStyle = .custom
    transitioningDelegate = self
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    modalPresentationStyle = .custom
    transitioningDelegate = self
  }

    override func viewDidLoad() {
        super.viewDidLoad()
      
      let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(exit))
      gestureRecognizer.cancelsTouchesInView = false
      gestureRecognizer.delegate = self
      view.addGestureRecognizer(gestureRecognizer)
      
      self.view.backgroundColor = UIColor.clear
      
      view.addSubview(popUpView)
      popUpView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
      popUpView.layer.cornerRadius = 8
      popUpView.translatesAutoresizingMaskIntoConstraints = false
      popUpView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
      popUpView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
      popUpView.widthAnchor.constraint(equalToConstant: 260).isActive = true
      popUpView.heightAnchor.constraint(equalToConstant: 280).isActive = true
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

  @IBAction func close() {
    //delegate?.didPickNewPageWithNumber(self, page: selectedNumber)
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func exit() {
    dismiss(animated: true, completion: nil)
  }
  
}

//MARK: UIGestureRecognizerDelegate
extension TicketStubViewController: UIGestureRecognizerDelegate {
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
    return (touch.view == self.view)
  }
}

//MARK: UIViewControllerTransitioningDelegate
extension TicketStubViewController: UIViewControllerTransitioningDelegate {
  
  func presentationController(forPresented presented: UIViewController,
                              presenting: UIViewController?,
                              source: UIViewController) -> UIPresentationController? {
    return DimmingPresentationController(presentedViewController: presented, presenting: presenting)
  }
  
  func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return BounceAnimationController()
  }
  
  func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return SlideOutAnimationController()
  }
}
