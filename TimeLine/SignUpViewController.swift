//
//  SignUpViewController.swift
//  TimeLine
//
//  Created by Joshua Kuehn on 11/18/16.
//  Copyright © 2016 Joshua Kuehn. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
  
  @IBAction func cancelButtonPressed(_ sender: Any) {
    self.navigationController?.dismiss(animated: true, completion: nil)
  }

}
