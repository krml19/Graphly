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
        let localDataProvider: LocalDataProvider = di.resolve(LocalDataProvider.self)
        let years = localDataProvider.models.years
        let populations = localDataProvider.models.populations
        
        var sections: [Section<GridChartCollectionViewModel, GridChartHeaderViewModel>] = []
        populations.forEach { (min, max) in
            var gridChartCollectionViewModels: [GridChartCollectionViewModel] = []
            for (index, year) in years.enumerated() {
                let scatterData = ScatterConverter.convert(input: localDataProvider.models, label: nil, filterClosure: { (unit) -> (Bool) in
                    return unit.year == year && unit.population >= min && unit.population < max
                })
                gridChartCollectionViewModels.append(GridChartCollectionViewModel(scatterData: scatterData, year: year, enabledLeftAxis: index == 0))
            }
            let section: Section<GridChartCollectionViewModel, GridChartHeaderViewModel> = Section(headerViewModel: GridChartHeaderViewModel(title: "Ludność: \(min) - \(max)"), items: gridChartCollectionViewModels)
            sections.append(section)
        }
        
        let dataSource = CollectionDataSource<GridChartCollectionViewModel, GridChartHeaderViewModel>(sections: sections)
        return dataSource
    }()
}


