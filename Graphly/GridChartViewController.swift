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
    
    private let viewModel: GridChartViewModel = di.resolve(GridChartViewModel.self)
    
    @IBOutlet weak var collectionView: NSCollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        collectionView.reloadData()
    }
    
    private func configureCollectionView() {
        collectionView.registerHeader(GridChartHeaderView.self)
        let flowLayout = NSCollectionViewFlowLayout()
        
        flowLayout.sectionInset = NSEdgeInsets(top: 10.0, left: 20.0, bottom: 10.0, right: 20.0)
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.minimumLineSpacing = 0.0
        flowLayout.sectionHeadersPinToVisibleBounds = true
        collectionView.collectionViewLayout = flowLayout
        view.wantsLayer = true
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
    
    func collectionView(_ collectionView: NSCollectionView, viewForSupplementaryElementOfKind kind: NSCollectionView.SupplementaryElementKind, at indexPath: IndexPath) -> NSView {
        let view = collectionView.makeHeaderView(GridChartHeaderView.self, indexPath: indexPath)
        guard let headerView = view as? GridChartHeaderView else { return view }
        let headerViewModel = viewModel.dataSource.headerViewModel(indexPath: indexPath)
        headerView.configure(viewModel: headerViewModel)

        return headerView
    }
}

extension GridChartViewController: NSCollectionViewDelegate {
    
}

extension GridChartViewController : NSCollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> NSSize {
        return NSSize(width: 1000, height: 40)
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForFooterInSection section: Int) -> NSSize {
        return NSSize.zero
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSSize(width: 200, height: 200)
    }
    
    
}

