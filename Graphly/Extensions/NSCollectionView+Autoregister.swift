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
    
    func registerHeader<T: NSView>(_: T.Type) {
        let nib = NSNib(nibNamed: NSNib.Name(rawValue: T.lastClassComponent()), bundle: nil)
        let identifier = NSUserInterfaceItemIdentifier(rawValue: T.className())
        self.register(nib, forSupplementaryViewOfKind: NSCollectionView.SupplementaryElementKind.sectionHeader, withIdentifier: identifier)
    }
    
    func registerFooter<T: NSView>(_: T.Type) {
        let nib = NSNib(nibNamed: NSNib.Name(rawValue: T.lastClassComponent()), bundle: nil)
        let identifier = NSUserInterfaceItemIdentifier(rawValue: T.className())
        self.register(nib, forSupplementaryViewOfKind: NSCollectionView.SupplementaryElementKind.sectionFooter, withIdentifier: identifier)
    }
    
    func make<T: NSCollectionViewItem>(_: T.Type, indexPath: IndexPath) -> NSCollectionViewItem {
        let identifier = NSUserInterfaceItemIdentifier(rawValue: T.className())
        return (makeItem(withIdentifier: identifier, for: indexPath))
    }
    
    func makeSupplementaryView<T: NSView>(_: T.Type, ofKind elementKind: NSCollectionView.SupplementaryElementKind, indexPath: IndexPath) -> NSView {
        let identifier = NSUserInterfaceItemIdentifier(rawValue: T.className())
        return makeSupplementaryView(ofKind: elementKind, withIdentifier: identifier, for: indexPath)
    }
    
    func makeHeaderView<T: NSView>(_ type: T.Type, indexPath: IndexPath) -> NSView {
        return makeSupplementaryView(type.self, ofKind: NSCollectionView.SupplementaryElementKind.sectionHeader, indexPath: indexPath)
    }
    
    func makeFooterView<T: NSView>(_ type: T.Type, indexPath: IndexPath) -> NSView {
        return makeSupplementaryView(type.self, ofKind: NSCollectionView.SupplementaryElementKind.sectionFooter, indexPath: indexPath)
    }
}
