//
//  HeatMapViewController.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa

class HeatMapViewController: NSViewController {

    
    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}

extension HeatMapViewController: NSTableViewDataSource, NSTableViewDelegate {

}


