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
  
  var pastConcerts:[PastConcert] = []
  
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
    setupPastTickets()
    
    avatarView.concerts = pastConcerts.count
    
    var hoursSaved:Double = 0.0
    for pastConcert in pastConcerts {
      hoursSaved = hoursSaved + Double(Double(pastConcert.hoursSaved ?? "0.0") ?? 0.0)
    }
    avatarView.hours = hoursSaved
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  
  func setupPastTickets() {
    pastConcerts.append(PastConcert(artistName: "Dan + Shay", date: "Nov 3, 2016", hoursSaved: "2", imageName: "DanShay.png"))
    pastConcerts.append(PastConcert(artistName: "Cody Johnson", date: "Oct 18, 2016", hoursSaved: "3", imageName: "CodyJ.png"))
    pastConcerts.append(PastConcert(artistName: "Molly & Pals", date: "Nov 25, 2016", hoursSaved: ".75", imageName: "MollyP.png"))
    pastConcerts.append(PastConcert(artistName: "21 Pilots", date: "Jul 15, 2016", hoursSaved: "2", imageName: "21Pilots.png"))
    pastConcerts.append(PastConcert(artistName: "Ben Rector", date: "Aug 23, 2016", hoursSaved: "3", imageName: "BenR.png"))
    pastConcerts.append(PastConcert(artistName: "Paper Weight", date: "Sep 27, 2016", hoursSaved: "1.25", imageName: "PaperWeight.png"))
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
    return pastConcerts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HistoryCellTableViewCell
   
    let artistName = pastConcerts[indexPath.row].artistName
    let date = pastConcerts[indexPath.row].date
    let image = pastConcerts[indexPath.row].imageName
    let time = pastConcerts[indexPath.row].hoursSaved
    
    cell.nameLabel.text = artistName
    cell.dateLabel.text = date
    cell.artistImageView.image = UIImage(named: image ?? "") ?? nil
    cell.hrsSavedLabel.text = time
    
    
    return cell
  }
}
