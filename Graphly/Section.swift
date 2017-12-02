//
//  Section.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Foundation

class Section<Item> {
    let title: String
    let items: [Item]
    
    init(title: String, items: [Item]) {
        self.title = title
        self.items = items
    }
}
