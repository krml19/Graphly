//
//  MenuViewController.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa

class MenuViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView! {
        didSet {
            tableView.register(MenuTableCellView.self)
        }
    }
    @IBOutlet weak var scrollView: NSScrollView!
    let viewModel = MenuViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension MenuViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return viewModel.numberOfRows()
    }
}

extension MenuViewController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellViewModel = viewModel.cellViewModelForRow(row: row)
        let cell: MenuTableCellView = tableView.make(MenuTableCellView.self, owner: self) as! MenuTableCellView
        cell.configure(viewModel: cellViewModel)
        return cell
    }
}

