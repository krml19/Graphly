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
    
    private let container: Container
    
    init(container: Container = Container()) {
        self.container = container
    }
    
    var dataProvider: DataProvider {
        return container.resolve(DataProvider.self)!
    }
    
    func setup() {
        container.register(DataProvider.self) { _ -> DataProvider in DataProvider() }
            .inObjectScope(ObjectScope.container)
    }
}
