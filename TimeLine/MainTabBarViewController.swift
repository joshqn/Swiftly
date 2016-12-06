//
//  MainTabBarViewController.swift
//  TimeLine
//
//  Created by Joshua Kuehn on 11/20/16.
//  Copyright © 2016 Joshua Kuehn. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
      let mainColor = UIColor.init(red: 116/255, green: 181/255, blue: 89/255, alpha: 1.0)

      selectedIndex = 2
      self.tabBar.tintColor = mainColor
      
      
      
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

}
