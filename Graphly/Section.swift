//
//  Section.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Foundation

class Section<Item, HeaderViewModel> {
    let headerViewModel: HeaderViewModel
    let items: [Item]
    
    init(headerViewModel: HeaderViewModel, items: [Item]) {
        self.headerViewModel = headerViewModel
        self.items = items
    }
}
