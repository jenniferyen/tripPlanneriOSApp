//
//  DataSource.swift
//  Apoio
//
//  Created by Jennifer Yen on 3/3/18.
//  Copyright © 2018 jenyen. All rights reserved.
//

import Foundation

class DataSource {
    
    static let sharedInstance = DataSource()
    
    var trips = [Trip]()
    
    
    private init() {}
    
}
