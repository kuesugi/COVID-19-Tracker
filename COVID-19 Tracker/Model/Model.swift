//
//  Model.swift
//  COVID-19 Tracker
//
//  Created by Zhaoyi Ma on 6/11/20.
//  Copyright © 2020 Zhaoyi Ma. All rights reserved.
//

import Foundation

struct TotalData {
    let confirmed: Int
    let critical: Int
    let deaths: Int
    let recovered: Int
    
    var fatalityRate: Double {
        return (100.00 * Double(deaths)) / Double(confirmed)
    }
    
    var recoverRate: Double {
        return (100.00 * Double(recovered)) / Double(confirmed)
    }
}

struct CountryData {
    let country: String
    let confirmed: Int64 // for core data use
    let critical: Int64
    let deaths: Int64
    let recovered: Int64
    let longitude: Double
    let latitude: Double
    
    var fatalityRate: Double {
        return (100.00 * Double(deaths)) / Double(confirmed)
    }
    
    var recoverRate: Double {
        return (100.00 * Double(recovered)) / Double(confirmed)
    }
}

let mockTotalData = TotalData(confirmed: 10, critical: 1, deaths: 2, recovered: 9)
let mockCountryData = CountryData(country: "MockCountry", confirmed: 6, critical: 2, deaths: 1, recovered: 4, longitude: 2.0, latitude: 1.0)
