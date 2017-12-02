//
//  NSStoryboard+Instantiate.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/3/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa

extension NSStoryboard {
    func instantiate<T: NSViewController>(type: T.Type) -> T? {
        return self.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: type.lastClassComponent())) as? T
    }
}
