//
//  ScatterViewController.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa
import Charts
import RxSwift
import RxCocoa

class ScatterViewController: NSViewController {
    
    @IBOutlet weak var populationSlider: NSSlider!
    @IBOutlet weak var timelineSlider: NSSlider!
    @IBOutlet weak var scatterView: ScatterChartView! {
        didSet {
            scatterView.legend.enabled = false
            scatterView.chartDescription?.enabled = false
            
        }
    }
    @IBOutlet weak var populationOutlet: NSTextField!
    @IBOutlet weak var yearOutlet: NSTextField!
    
    let viewModel: ScatterViewModel = di.resolve(ScatterViewModel.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timelineSlider.numberOfTickMarks = viewModel.localDataProvider.models.sizeYear
        populationSlider.numberOfTickMarks = viewModel.localDataProvider.models.populations.count
        prepareData()
    }
    
    @IBAction func populationValueChanged(_ sender: NSSlider) {
        prepareData()
    }
    
    @IBAction func timelineValueChanged(_ sender: NSSlider) {
        prepareData()
    }
}

extension ScatterViewController {
    func prepareData() {
        scatterView.data = viewModel.prepareData(timelineValue: timelineSlider.tickValue(), populationValue: populationSlider.tickValue())
        scatterView.notifyDataSetChanged()
        yearOutlet.stringValue = "Rok: \(viewModel.year)"
        populationOutlet.stringValue = "Ludność: \(viewModel.population.min) - \(viewModel.population.max)"
    }
}


