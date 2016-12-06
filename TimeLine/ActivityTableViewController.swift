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

    override func viewDidLoad() {
        super.viewDidLoad()
      
      searchController.searchResultsUpdater = self
      searchController.searchBar.delegate = self
      definesPresentationContext = true
      searchController.dimsBackgroundDuringPresentation = false
      
      tableView.tableHeaderView = searchController.searchBar

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
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
