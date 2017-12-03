//
//  SplitViewController.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa

class SplitViewController: NSSplitViewController {
    
    @IBOutlet weak var splitViewOutlet: NSSplitView!
    
    @IBOutlet weak var chartsItemOutlet: NSSplitViewItem!
    @IBOutlet weak var menuItemOutlet: NSSplitViewItem!
    override func viewDidLoad() {
        super.viewDidLoad()
//        splitView.setPosition(200, ofDividerAt: 0)
    }
}
