//
//  SeachBarTableViewController.swift
//  iosAllergyApp
//
//  Created by Melissa Nguyen on 5/16/20.
//  Copyright © 2020 Melissa Nguyen. All rights reserved.
//

import UIKit

class SeachBarTableViewController: UITableViewController {

    
    let data = ["melissa", "loc", "tom"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

 
 

}


 

   
