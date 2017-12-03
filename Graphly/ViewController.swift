//
//  ViewController.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa


class ViewController: NSViewController {
    
    @IBOutlet weak var containerView: NSView!
    
    @IBOutlet weak var titleOutlet: NSTextField!
    lazy var gridChartViewController: GridChartViewController = {
        return storyboard?.instantiate(type: GridChartViewController.self)!
    }()!
    
    lazy var scatterViewController: ScatterViewController = {
        return storyboard?.instantiate(type: ScatterViewController.self)!
    }()!
    
    lazy var heatMapViewController: HeatMapViewController = {
        return storyboard?.instantiate(type: HeatMapViewController.self)!
    }()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defer {
            NotificationCenter.default.addObserver(self, selector: #selector(dispsatchNotification(notification:)), name: .onSegmentChanged, object: nil)
        }
       
        prepareView()
        prepareChildViewController(index: 0)
    }
    
    private func prepareView() {
        containerView.wantsLayer = true
        containerView.layer?.backgroundColor = NSColor.white.cgColor
        
    }
    
    func prepareChildViewController(index: Int) {
        guard di.resolve(ControllersInfoProvider.self).controllers.inRange(index: index) else { return }
        if di.resolve(ControllersInfoProvider.self).controllers[index] == ControllersInfoProvider.Controllers.scatter.type {
            displayContentController(content: scatterViewController, containerView: containerView)
            titleOutlet.stringValue = ControllersInfoProvider.Controllers.scatter.title
        }
        if di.resolve(ControllersInfoProvider.self).controllers[index] == ControllersInfoProvider.Controllers.grid.type {
            displayContentController(content: gridChartViewController, containerView: containerView)
            titleOutlet.stringValue = ControllersInfoProvider.Controllers.grid.title
        }
        if di.resolve(ControllersInfoProvider.self).controllers[index] == ControllersInfoProvider.Controllers.heatMap.type {
            displayContentController(content: heatMapViewController, containerView: containerView)
            titleOutlet.stringValue = ControllersInfoProvider.Controllers.heatMap.title
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

