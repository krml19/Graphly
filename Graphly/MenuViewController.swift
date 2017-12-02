//
//  MenuViewController.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa

class MenuViewController: NSViewController {
    typealias SelectionClosure = ((Int) -> ())
    var onSelectChanged: SelectionClosure?

    @IBOutlet weak var tableView: NSTableView! {
        didSet {
            tableView.register(MenuTableCellView.self)
        }
    }
    @IBOutlet weak var scrollView: NSScrollView!
    let viewModel: MenuViewModel = di.resolve(MenuViewModel.self)
    
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
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        if (onSelectChanged != nil) {
            onSelectChanged!(tableView.selectedRow)
            
        }
        NotificationCenter.default.post(name: .onSegmentChanged, object: nil, userInfo: ["index" : tableView.selectedRow])
    }
}

