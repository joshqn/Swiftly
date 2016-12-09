//
//  LoginViewController.swift
//  TimeLine
//
//  Created by Joshua Kuehn on 11/18/16.
//  Copyright © 2016 Joshua Kuehn. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

  @IBOutlet weak var loginButton: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      loginButton.layer.cornerRadius = loginButton.frame.height/2
      
      
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  @IBAction func forgotPassButtonTapped(_ sender: Any) {
    let alert = UIAlertController(title: "Forgot Password", message: "Enter your Email Address", preferredStyle: .alert)
    alert.addTextField { (email) in
      email.placeholder = "Email Address"
    }
    
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alert) in
      self.dismiss(animated: true, completion: nil)
    }))
    
    alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { (alert) in
      self.dismiss(animated: true, completion: nil)
    }))
    
    present(alert, animated: true, completion: nil)
  }
  
  @IBAction func loginButtonTapped(_ sender: Any) {
  }
  
}
