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
    
    @IBOutlet weak var heatLegend: NSView!
    @IBOutlet weak var yAxisLabel: NSTextField!
    
    @IBOutlet weak var maxLegendLabel: NSTextField!
    @IBOutlet weak var avgLegendLabel: NSTextField!
    @IBOutlet weak var minLegendLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        prepareUI()
    }
    
//    override func viewDidLayout() {
//        tableView.reloadData()
//    }
}

extension HeatMapViewController: NSTableViewDataSource, NSTableViewDelegate {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return viewModel.units.populations.count
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = NSView()
        cell.wantsLayer = true
        cell.layer?.backgroundColor = viewModel.getColorFor(row: row, column: tableView.tableColumns.index(of: tableColumn!)!)
        tableColumn?.minWidth = tableView.frame.width/CGFloat(viewModel.units.years.count)
        tableColumn?.width = tableView.frame.width/CGFloat(viewModel.units.years.count)
        return cell
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return tableView.frame.height/CGFloat(viewModel.units.populations.count)-5.0
    }
}

extension HeatMapViewController {
    private func prepareUI() {
//        applyGradient()
        configureLabels()
        prepareTableView()
        prepareLegend()
    }
    
    private func prepareTableView() {
        tableView.autoresizesSubviews = true
        tableView.columnAutoresizingStyle = .uniformColumnAutoresizingStyle
        tableView.rowSizeStyle = .large
    }
    
//    private func applyGradient() {
//        let colorTop = NSColor(red: 48 / 255, green: 35 / 255, blue: 174 / 255, alpha: 1).cgColor
//        let colorBottom = NSColor(red: 200 / 255, green: 109 / 255, blue: 215 / 255, alpha: 1).cgColor
//        let gradient  = CAGradientLayer()
//        gradient.colors = [ colorTop, colorBottom]
//        gradient.locations = [ 0.0, 1.0]
//        heatLegend.layer = gradient
//    }
    
    private func configureLabels() {
        yAxisLabel.frameRotation = 90.0
    }
    
    private func prepareLegend() {
        guard let min = viewModel.minRatio else { return }
        guard let max = viewModel.maxRatio else { return }
        let gradient = CAGradientLayer()
        gradient.colors = [ viewModel.getColorFor(ratio: min), viewModel.getColorFor(ratio: max) ]
        gradient.locations = [ 0.0, 1.0]
        heatLegend.layer = gradient
        minLegendLabel.stringValue = String(min)
        maxLegendLabel.stringValue = String(max)
    }
}
