//
//  MenuViewModel.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa

class MenuViewModel: NSObject {
    private let models: [MenuItemViewModel] = di.resolve(ControllersInfoProvider.self).menuItems
    
    func numberOfRows() -> Int {
        return models.count
    }
    
    func cellViewModelForRow(row: Int) -> MenuItemViewModel {
        return models[row]
    }
}
