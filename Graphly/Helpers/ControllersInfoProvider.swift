//
//  DataProvider.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa

class ControllersInfoProvider {
    enum Controllers: Int {
        case heatMap
        case grid
        case scatter
        
        var menuItem: MenuItemViewModel {
            switch self {
            case .heatMap:
                return MenuItemViewModel(title: "Heat Map")
            case .grid:
                return MenuItemViewModel(title: "Grid")
            case .scatter:
                return MenuItemViewModel(title: "Scatter")
            }
        }
        
        var type: NSViewController.Type {
            switch self {
            case .heatMap:
                return HeatMapViewController.self
            case .grid:
                return GridChartViewController.self
            case .scatter:
                return ScatterViewController.self
            }
        }
    }
    
    var menuItems: [MenuItemViewModel] {
      return [Controllers.grid.menuItem, Controllers.heatMap.menuItem, Controllers.scatter.menuItem]
    }
    
    var controllers: [NSViewController.Type] {
        return [Controllers.grid.type, Controllers.heatMap.type, Controllers.scatter.type]
    }
}



