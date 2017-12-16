//
//  ScatterChartView+Wireframe.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/16/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Foundation
import Charts

public typealias Wireframe = (minX: Double, maxX: Double, minY: Double, maxY: Double)

extension ScatterChartView {
    func applyWireframe(wireframe: Wireframe) {
        self.leftAxis.axisMinimum = wireframe.minY
        self.leftAxis.axisMaximum = wireframe.maxY
        self.rightAxis.axisMinimum = wireframe.minY
        self.rightAxis.axisMaximum = wireframe.maxY
        
        self.xAxis.axisMinimum = wireframe.minX
        self.xAxis.axisMaximum = wireframe.maxX
    }
}

