//
//  AppDelegate.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa
import SwiftyBeaver

let di = DependencyInjection()

let log = SwiftyBeaver.self

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        configureApplication()
    }


    func applicationWillTerminate(_ aNotification: Notification) {
    
    }

}

fileprivate extension AppDelegate {
    func configureApplication() {
        setupLogger()
    }
    
    private func setupLogger() {
        let console = ConsoleDestination()  // log to Xcode Console
//        console.format = "$DHH:mm:ss$d $L $M"
        log.addDestination(console)
    }
}
