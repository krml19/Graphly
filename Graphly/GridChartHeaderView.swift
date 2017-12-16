//
//  GridChartHeaderView.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/3/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa

class GridChartHeaderView: NSView {

    @IBOutlet weak var titleOutlet: NSTextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleOutlet.backgroundColor = Constants.Menu.selectionColor
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
    }
    
    public func configure(viewModel: GridChartHeaderViewModel) {
        titleOutlet.stringValue = viewModel.title
    }
}
