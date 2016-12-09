//
//  ActivityTableViewController.swift
//  TimeLine
//
//  Created by Joshua Kuehn on 12/2/16.
//  Copyright © 2016 Joshua Kuehn. All rights reserved.
//

import UIKit


class ActivityTableViewController: UITableViewController {
  
  let searchController = UISearchController(searchResultsController: nil)
  
  var tickets:[Ticket] = []

    override func viewDidLoad() {
        super.viewDidLoad()
      
      searchController.searchResultsUpdater = self
      searchController.searchBar.delegate = self
      definesPresentationContext = true
      searchController.dimsBackgroundDuringPresentation = false
      searchController.hidesNavigationBarDuringPresentation = false
      
      tableView.tableHeaderView = searchController.searchBar
      setupTickets()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  fileprivate func setupTickets() {
    tickets.append(Ticket(artistName: "Luke Bryan", date: "Dec 8, 2016", image: "LukeBryan.png", time: "6 PM"))
    tickets.append(Ticket(artistName: "Little Big Town", date: "Jan 2, 2017", image: "LBTown.png", time: "9 PM"))
    tickets.append(Ticket(artistName: "Florida Georgia Line", date: "Dec 22, 2016", image: "FGLine.png", time: "8 PM"))
    tickets.append(Ticket(artistName: "Dierks Bentley", date: "Feb 13, 2017", image: "DB.png", time: "8 PM"))
    tickets.append(Ticket(artistName: "Tim McGraw", date: "Jan 19, 2017", image: "TimMcGraw.png", time: "8 PM"))
    tickets.append(Ticket(artistName: "Brad Paisley", date: "March 13, 2017", image: "BradP.png", time: "10 PM"))
    tickets.append(Ticket(artistName: "The Band Perry", date: "Dec 19, 2016", image: "TheBandPerry.png", time: "6:30 PM"))
    tickets.append(Ticket(artistName: "Dan + Shay", date: "Feb 2, 2016", image: "DanShay.png", time: "5 PM"))
    tickets.append(Ticket(artistName: "Eric Church", date: "April 12, 2017", image: "EricChurch.png", time: "8 PM"))
  }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tickets.count
    }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ActivityTableCell
    
    let artistName = tickets[indexPath.row].artistName
    let date = tickets[indexPath.row].date
    let image = tickets[indexPath.row].image
    let time = tickets[indexPath.row].time
    
    cell.artistNameLabel.text = artistName
    cell.dateLabel.text = date
    cell.artistImageView.image = UIImage(named: image ?? "") ?? nil
    cell.timeLabel.text = time
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let ticketStubVC = TicketStubViewController(nibName: nil, bundle: nil)
    ticketStubVC.popUpView.artistName = tickets[indexPath.row].artistName ?? ""
    ticketStubVC.popUpView.time = tickets[indexPath.row].time ?? ""
    
    present(ticketStubVC, animated: true, completion: nil)
    
    tableView.deselectRow(at: indexPath, animated: true)
  }

}

extension ActivityTableViewController: UISearchBarDelegate {
  
  func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
    
  }
  
}

extension ActivityTableViewController: UISearchResultsUpdating {
  
  func updateSearchResults(for searchController: UISearchController) {
    
  }
  
}
