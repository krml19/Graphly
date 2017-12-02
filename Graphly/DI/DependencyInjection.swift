//
// Created by Marcin Karmelita on 12/2/17.
// Copyright (c) 2017 Marcin Karmelita. All rights reserved.
//

import Foundation
import Swinject

class DependencyInjection {
    func resolve<T>(_: T.Type) -> T {
        return container.resolve(T.self)!
    }
    
    fileprivate let container: Container
    
    init(container: Container = Container()) {
        self.container = container
        setup()
    }
    
    var controllersInfoProvider: ControllersInfoProvider {
        return container.resolve(ControllersInfoProvider.self)!
    }
    
    func setup() {
        setupProviders()
        setupViewModels()
    }
}

fileprivate extension DependencyInjection {
    func setupProviders() {
        container.register(ControllersInfoProvider.self) { _ -> ControllersInfoProvider in ControllersInfoProvider() }
            .inObjectScope(ObjectScope.container)
        
        container.register(DataProvider.self) { _ -> DataProvider in MockDataProvider() }
            .inObjectScope(ObjectScope.container)
    }
}

fileprivate extension DependencyInjection {
    func setupViewModels() {
        container.register(MenuViewModel.self) { _ -> MenuViewModel in MenuViewModel() }
            .inObjectScope(ObjectScope.container)
        
        container.register(ScatterViewModel.self) { _ -> ScatterViewModel in ScatterViewModel() }
            .inObjectScope(ObjectScope.container)
        
        container.register(GridChartViewModel.self) { _ -> GridChartViewModel in GridChartViewModel() }
            .inObjectScope(ObjectScope.container)
    }
}
