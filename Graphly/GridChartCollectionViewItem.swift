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

    @IBOutlet weak var scatterChartView: ScatterChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configure(viewModel: GridChartCollectionViewModel) {
        scatterChartView.data = viewModel.scatterData
    }
}
