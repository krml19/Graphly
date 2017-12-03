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
    let disposeBag = DisposeBag()
    @IBOutlet weak var populationSlider: NSSlider!
    @IBOutlet weak var timelineSlider: NSSlider!
    @IBOutlet weak var scatterView: ScatterChartView! 
    
    let viewModel: ScatterViewModel = di.resolve(ScatterViewModel.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scatterView.data = ScatterChartData()
        prepareData(timelineValue: timelineSlider.tickMarkPosition.rawValue, populationValue: populationSlider.tickMarkPosition.rawValue)
    }
    
    @IBAction func populationValueChanged(_ sender: NSSlider) {
        log.info(sender.tickMarkPosition.rawValue)
        prepareData(timelineValue: timelineSlider.tickMarkPosition.rawValue, populationValue: populationSlider.tickMarkPosition.rawValue)
    }
    
    @IBAction func timelineValueChanged(_ sender: NSSlider) {
        log.info(sender.tickMarkPosition.rawValue)
        
        prepareData(timelineValue: timelineSlider.tickMarkPosition.rawValue, populationValue: populationSlider.tickMarkPosition.rawValue)
    }
}

extension ScatterViewController {
    func prepareData(timelineValue: UInt, populationValue: UInt) {
        viewModel.prepareData(timelineValue: timelineValue, populationValue: populationValue) { [weak self] (scatterData) in
            DispatchQueue.main.async {
                guard let strongSelf = self else { return }
//                strongSelf.populationSlider.numberOfTickMarks = strongSelf.viewModel.populationValues.size
//                strongSelf.timelineSlider.numberOfTickMarks = strongSelf.viewModel.populationValues.size
                strongSelf.scatterView.data = scatterData
                strongSelf.scatterView.notifyDataSetChanged()
            }
        }
    }
}
