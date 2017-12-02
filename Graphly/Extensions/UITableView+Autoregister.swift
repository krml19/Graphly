//
//  UITableView+Autoregister.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa
extension NSTableView {
    func register<T: NSTableCellView>(_: T.Type) {
        let nib = NSNib(nibNamed: NSNib.Name(rawValue: T.className().components(separatedBy: ".").last!), bundle: nil)
        let identifier = NSUserInterfaceItemIdentifier(rawValue: T.className())
        self.register(nib, forIdentifier: identifier)
    }
    
    func make<T: NSTableCellView>(_: T.Type, owner: Any?) -> NSView? {
        let identifier = NSUserInterfaceItemIdentifier(rawValue: T.className())
        return makeView(withIdentifier: identifier, owner: self)
    }
}
