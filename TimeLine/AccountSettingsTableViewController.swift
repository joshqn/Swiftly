//
//  AccountSettingsTableViewController.swift
//  TimeLine
//
//  Created by Joshua Kuehn on 11/26/16.
//  Copyright © 2016 Joshua Kuehn. All rights reserved.
//

import UIKit

class AccountSettingsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
      
      self.navigationController?.hidesBottomBarWhenPushed = false
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  @IBAction func doneButtonTapped(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)

  }
}
