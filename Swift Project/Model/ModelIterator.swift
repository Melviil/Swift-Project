//
//  ModelIterator.swift
//  Swift Project
//
//  Created by Melvil on 11/03/2018.
//  Copyright © 2018 Melvil. All rights reserved.
//

import Foundation

struct ModelIterator: IteratorProtocol {
    typealias Element = <#type#>
    
    private let database: Coredata
    private var index = 0
    
    init(database: Database = .shared) {
        self.database = database
    }
    
    mutating func next() -> Model? {
        let model = database.model(at: index)
        index += 1
        return model
    }
}
