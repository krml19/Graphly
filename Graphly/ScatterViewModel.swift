//
//  ScatterViewModel.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa
import Charts

class ScatterViewModel: NSObject {
    
    var data: ScatterChartData = di.resolve(DataProviderProtocol.self).scatterData
    
    
}
