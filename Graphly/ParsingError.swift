//
//  ParsingError.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/3/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Foundation

struct ParsingError: Error {
    private let domain: String = "parsing.error"
    private let code: Int = -4656
    let title: String
    init(title: String) {
        self.title = title
    }
}
