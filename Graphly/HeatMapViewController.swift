//
//  HeatMapViewController.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa

class HeatMapViewController: NSViewController {

    private let viewModel:HeatMapViewModel = HeatMapViewModel()
    private let numFormatter = NumberFormatter()
    private let loadingView = NSView()
    
    @IBOutlet weak var tableView: NSTableView! {
        didSet {
            let firstColumn = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "populations"))
            firstColumn.headerCell.title = ""
            tableView.addTableColumn(firstColumn)
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
    
    
    @IBOutlet weak var loadingScreen: NSView!
    @IBOutlet weak var progressIndicator: NSProgressIndicator!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoadingScreen()
        viewModel.delegate = self
        viewModel.loadData()
        prepareUI()
    }
}

extension HeatMapViewController: NSTableViewDataSource, NSTableViewDelegate {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return viewModel.units.populations.count
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if tableView.tableColumns.index(of: tableColumn!)! == 0 {
            let population = viewModel.units.populations[row]
            let min = numFormatter.string(for: population.min)
            let max = numFormatter.string(for: population.max)
            let label = NSTextField.init(wrappingLabelWithString: "\(String(describing: min!))- \(String(describing: max!))")
            label.alignment = .right
            label.font = NSFont.systemFont(ofSize: 10.0, weight: .thin)
            tableColumn?.minWidth = tableView.frame.width/(CGFloat(viewModel.units.years.count)+1)
            tableColumn?.width = tableView.frame.width/(CGFloat(viewModel.units.years.count)+1)
            return label
        } else {
            let cell = NSView()
            cell.wantsLayer = true
            cell.layer?.backgroundColor = viewModel.getColorFor(row: row, column: (tableView.tableColumns.index(of: tableColumn!)! - 1 ))
            tableColumn?.minWidth = tableView.frame.width/(CGFloat(viewModel.units.years.count)+1)
            tableColumn?.width = tableView.frame.width/(CGFloat(viewModel.units.years.count)+1)
            return cell
        }
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return tableView.frame.height/CGFloat(viewModel.units.populations.count)-5.0
    }
}

extension HeatMapViewController: HeatMapViewModelDelegate {
    func didFinishLoadingData() {
        hideLoadingScreen()
        tableView.delegate = self
        tableView.dataSource = self
        prepareLegend()
    }
}

extension HeatMapViewController {
    
    private func showLoadingScreen(){
        loadingScreen.wantsLayer = true
        loadingScreen.alphaValue = 0.9
        loadingScreen.layer?.backgroundColor = CGColor.white
        progressIndicator.startAnimation(self)
    }
    
    private func hideLoadingScreen() {
        progressIndicator.stopAnimation(self)
        loadingScreen.removeFromSuperview()
    }
    
    private func prepareUI() {
        prepareFormatter()
        configureLabels()
        prepareTableView()
    }
    
    private func prepareTableView() {
        tableView.autoresizesSubviews = true
        tableView.columnAutoresizingStyle = .uniformColumnAutoresizingStyle
        tableView.rowSizeStyle = .large
    }
    
    private func prepareFormatter() {
        numFormatter.numberStyle = .decimal
        numFormatter.locale = NSLocale(localeIdentifier: "pl") as Locale!
    }
    
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
