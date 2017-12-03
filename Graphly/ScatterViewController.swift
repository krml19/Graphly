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
    @IBOutlet weak var scatterView: ScatterChartView! 
    
    let viewModel: ScatterViewModel = di.resolve(ScatterViewModel.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scatterView.data = ScatterChartData(dataSets: [ScatterChartDataSet(values: [ChartDataEntry(x: 0, y: 0)])])
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
        viewModel.prepareData(timelineValue: timelineSlider.tickValue(), populationValue: populationSlider.tickValue()) { [weak self] (scatterData) in
            DispatchQueue.main.async {
                guard let strongSelf = self else { return }

                strongSelf.scatterView.data = scatterData
                strongSelf.scatterView.notifyDataSetChanged()
            }
        }
    }
}


