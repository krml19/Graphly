//
//  AppDelegate.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa
let di = DependencyInjection()

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        setup()
    }


    func applicationWillTerminate(_ aNotification: Notification) {
    
    }



}

fileprivate extension AppDelegate {
    func setup() {
        installDependencies()
    }
    
    private func installDependencies() {
        di.setup()
    }
}
