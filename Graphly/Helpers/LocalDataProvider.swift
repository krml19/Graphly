//
//  LocalDataProvider.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/3/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Foundation

class LocalDataProvider {
    typealias Completion = ((Units, Error?)->())
    private let filename: String
    private let ext: String
    var models: Units = Units()
    
    init(filename: String) {
        let components: [String] = filename.components(separatedBy: ".")
        self.filename = components[0]
        self.ext = components[1]
    }
    
    func getModels(completion: Completion) {
        if !models.list.isEmpty {
            completion(models, nil)
        }
        
        guard let url  = Bundle.main.url(forResource: filename, withExtension: ext) else {
            completion(models, ParsingError(title: "File does not exist"))
            return
        }
        do {
            let data = try Data(contentsOf: url)
            models.list = try JSONDecoder().decode([Unit].self, from: data)
            completion(models, nil)
        } catch {
            completion(models, error)
        }
    }
}
