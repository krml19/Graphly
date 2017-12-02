//
//  MenuTableCellView.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa

class MenuTableCellView: NSTableCellView {

    @IBOutlet weak var titleOutlet: NSTextField!
    
    public func configure(viewModel: MenuItemViewModel) {
        titleOutlet.stringValue = viewModel.title
    }
    
}
