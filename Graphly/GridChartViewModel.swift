//
//  GridChatViewModel.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Foundation
import Charts

class GridChartViewModel: ViewModel {
    
    var dataSource: CollectionDataSource<GridChartCollectionViewModel, GridChartHeaderViewModel> = {
        var items: [GridChartCollectionViewModel] = []
        for i in 0...20 {
            items.append(GridChartCollectionViewModel(scatterData: di.resolve(DataProvider.self).scatterData))
        }
       
        let section0 = Section<GridChartCollectionViewModel, GridChartHeaderViewModel>(headerViewModel: GridChartHeaderViewModel(title: "0"), items: items)
        let section1 = Section<GridChartCollectionViewModel, GridChartHeaderViewModel>(headerViewModel: GridChartHeaderViewModel(title: "1"), items: items)
        let section2 = Section<GridChartCollectionViewModel, GridChartHeaderViewModel>(headerViewModel: GridChartHeaderViewModel(title: "2"), items: items)
        let sections = [section0, section1, section2]
        let dataSource = CollectionDataSource<GridChartCollectionViewModel, GridChartHeaderViewModel>(sections: sections)
        return dataSource
    }()
}
