//
//  HeatMapViewController.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa

class HeatMapViewController: NSViewController {

    private let viewModel = HeatMapViewModel()
    
    @IBOutlet weak var tableView: NSTableView! {
        didSet {
            let years = Array(viewModel.units.minYear ... viewModel.units.maxYear)
            for year in years {
                let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: String(year)))
                column.headerCell.title = String(String(year))
                tableView.addTableColumn(column)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension HeatMapViewController: NSTableViewDataSource, NSTableViewDelegate {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return viewModel.units.populations.count
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = NSView()
        cell.wantsLayer = true
        cell.layer?.backgroundColor = viewModel.getColorFor(row: row, column: tableView.tableColumns.index(of: tableColumn!)!)
        return cell
    }
}


