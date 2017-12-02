//
//  NSObject+LastClassComponent.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Foundation

extension NSObject {
    class func lastClassComponent() -> String {
        return self.className().components(separatedBy: ".").last!
    }
}
