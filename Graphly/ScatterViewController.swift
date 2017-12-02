//
//  ScatterViewController.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa
import Charts

class ScatterViewController: NSViewController {

    @IBOutlet weak var timelineSlider: NSSlider!
    @IBOutlet weak var scatterView: ScatterChartView! 
    
    let viewModel: ScatterViewModel = di.resolve(ScatterViewModel.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scatterView.data = viewModel.data
    }
    
}
