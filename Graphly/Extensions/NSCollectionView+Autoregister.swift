//
//  NSCollectionView+Autoregister.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa
extension NSCollectionView {
    func register<T: NSCollectionViewItem>(_: T.Type) {
        let nib = NSNib(nibNamed: NSNib.Name(rawValue: T.lastClassComponent()), bundle: nil)
        let identifier = NSUserInterfaceItemIdentifier(rawValue: T.className())
        self.register(nib, forItemWithIdentifier: identifier)
    }
    
    func make<T: NSCollectionViewItem>(_: T.Type, indexPath: IndexPath) -> NSCollectionViewItem {
        let identifier = NSUserInterfaceItemIdentifier(rawValue: T.className())
        return (makeItem(withIdentifier: identifier, for: indexPath))
    }
}
