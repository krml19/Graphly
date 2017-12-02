//
//  ViewController.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa


class ViewController: NSViewController {
    
    lazy var gridChartViewController: GridChartViewController = {
        return storyboard?.instantiate(type: DataProvider.Controllers.grid.type)! as! GridChartViewController
    }()
    
    lazy var scatterViewController: ScatterViewController = {
        return storyboard?.instantiate(type: DataProvider.Controllers.scatter.type)! as! ScatterViewController
    }()
    
    lazy var heatMapViewController: HeatMapViewController = {
        return storyboard?.instantiate(type: DataProvider.Controllers.heatMap.type)! as! HeatMapViewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(dispsatchNotification(notification:)), name: .onSegmentChanged, object: nil)
    }
    
    func prepareChildViewController(index: Int) {
        if di.resolve(DataProvider.self).controllers[index] == DataProvider.Controllers.scatter.type {
            displayContentController(content: scatterViewController, containerView: view)
        }
        if di.resolve(DataProvider.self).controllers[index] == DataProvider.Controllers.grid.type {
            displayContentController(content: gridChartViewController, containerView: view)
        }
        if di.resolve(DataProvider.self).controllers[index] == DataProvider.Controllers.heatMap.type {
            displayContentController(content: heatMapViewController, containerView: view)
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func dispsatchNotification(notification: Notification) {
        print("\(notification)")
        guard let index = notification.userInfo?["index"] as? Int else { return }
        prepareChildViewController(index: index)
    }
}

