//
//  CollectionDataSource.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Foundation

class CollectionDataSource<Item, HeaderViewModel> {
    let sections: [Section<Item, HeaderViewModel>]
    init(sections: [Section<Item, HeaderViewModel>]) {
        self.sections = sections
    }
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfItems(section: Int) -> Int {
        return sections[section].items.count
    }
    
    func item(indexPath: IndexPath) -> Item {
        return sections[indexPath.section].items[indexPath.item]
    }
    
    func headerViewModel(indexPath: IndexPath) -> HeaderViewModel {
        return sections[indexPath.section].headerViewModel
    }
}
