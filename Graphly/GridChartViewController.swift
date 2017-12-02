//
//  GridViewController.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa
import Charts

class GridChartViewController: NSViewController {
    
    let viewModel: GridChartViewModel = di.resolve(GridChartViewModel.self)
    
    @IBOutlet weak var collectionView: NSCollectionView! {
        didSet {
            collectionView.minItemSize = NSSize(width: 200, height: 200)
            collectionView.maxItemSize = NSSize(width: 1000, height: 1000)
            // 1
            let flowLayout = NSCollectionViewFlowLayout()
            flowLayout.itemSize = NSSize(width: 200, height: 200)
            flowLayout.sectionInset = NSEdgeInsets(top: 10.0, left: 20.0, bottom: 10.0, right: 20.0)
            flowLayout.minimumInteritemSpacing = 20.0
            flowLayout.minimumLineSpacing = 20.0
            collectionView.collectionViewLayout = flowLayout
            // 2
            view.wantsLayer = true
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension GridChartViewController: NSCollectionViewDataSource {
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return viewModel.dataSource.numberOfSections()
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.dataSource.numberOfItems(section: section)
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let cellViewModel = viewModel.dataSource.item(indexPath: indexPath)
        let cellViewItem = collectionView.make(GridChartCollectionViewItem.self, indexPath: indexPath)
        guard let cell = cellViewItem as? GridChartCollectionViewItem else { return cellViewItem }
        cell.configure(viewModel: cellViewModel)
        return cell
    }
}

extension GridChartViewController: NSCollectionViewDelegate {
    
} 

