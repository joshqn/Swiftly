//
//  ProfileViewController.swift
//  TimeLine
//
//  Created by Joshua Kuehn on 11/20/16.
//  Copyright © 2016 Joshua Kuehn. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

  @IBOutlet weak var avatarView: AvatarView!
  
  @IBOutlet weak var tableView: UITableView!
  
  lazy var formatter: DateFormatter = {
    var formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    
    return formatter
  }()
  
  override func viewDidLoad() {
      super.viewDidLoad()

    self.navigationController?.hidesBottomBarWhenPushed = false
    
    tableView.delegate = self
    tableView.dataSource = self
    
    automaticallyAdjustsScrollViewInsets = false
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }

}

extension ProfileViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}

extension ProfileViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.detailTextLabel?.text = formatter.string(from: Date())
    cell.textLabel?.text = "Luke Bryan"
    
    avatarView.concerts = avatarView.concerts + 1
    
    return cell
  }
}
