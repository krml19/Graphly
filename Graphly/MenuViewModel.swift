//
//  MenuViewModel.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa

class MenuViewModel: NSObject {
    private let models: [MenuItemViewModel] = [MenuItemViewModel(title: "Heat Map"), MenuItemViewModel(title: "Zoom"), MenuItemViewModel(title: "Grid")]
    
    func numberOfRows() -> Int {
        return models.count
    }
    
    func cellViewModelForRow(row: Int) -> MenuItemViewModel {
        return models[row]
    }
}
