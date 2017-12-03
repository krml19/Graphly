//
//  LocalDataProvider.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/3/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Foundation

class LocalDataProvider {
    private let filename: String
    private let ext: String
    private(set) var models: Units = Units()
    
    init(filename: String) {
        let components: [String] = filename.components(separatedBy: ".")
        self.filename = components[0]
        self.ext = components[1]
        parseModels()
    }
    
    private func parseModels() {
        guard let url  = Bundle.main.url(forResource: filename, withExtension: ext) else {
            log.error("Cannot parse")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            models.list = try JSONDecoder().decode([Unit].self, from: data)
        } catch {
            log.error(error)
        }
    }
}
