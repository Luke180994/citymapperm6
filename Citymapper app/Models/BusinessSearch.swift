//
//  BusinessSearch.swift
//  Citymapper app
//
//  Created by Luke Davis on 23/11/2021.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var total = 0
    var region = Region()
    
}

struct Region: Decodable {
    
    var center = Coordinate()
    
}
