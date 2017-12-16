//
//  GridChartCollectionViewItem.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa
import Charts

class GridChartCollectionViewItem: NSCollectionViewItem {
    
    @IBOutlet weak var titleOutlet: NSTextField!
    @IBOutlet weak var scatterChartView: ScatterChartView! {
        didSet {
            scatterChartView.legend.enabled = false
            scatterChartView.chartDescription?.enabled = false
            scatterChartView.rightAxis.enabled = false
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configure(viewModel: GridChartCollectionViewModel) {
        scatterChartView.data = viewModel.scatterData
        titleOutlet.stringValue = "\(viewModel.year)"
        scatterChartView.leftAxis.drawLabelsEnabled = viewModel.enabledLeftAxis
        scatterChartView.applyWireframe(wireframe: viewModel.wireframe)
    }
}
