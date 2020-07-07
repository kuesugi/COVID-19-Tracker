//
//  DataFetchRequest.swift
//  COVID-19 Tracker
//
//  Created by Zhaoyi Ma on 6/10/20.
//  Copyright © 2020 Zhaoyi Ma. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CountryStatsFetchRequest: ObservableObject {
    @Published var detailedCountryData: DetailedCountryData?
    
    let headers: HTTPHeaders = [
        "x-rapidapi-host": "covid-193.p.rapidapi.com",
        "x-rapidapi-key": apiKey
    ]
    
    init() {
        
    }
    
    func getStatsFor(country: String) {
        AF.request("https://covid-193.p.rapidapi.com/statistics?country=\(country)", headers: headers).responseJSON { response in
            let result = response.data
            
            if result != nil {
                let json = JSON(result!)
                // print(json["response"][0]["country"])
                
                let country = json["response"][0]["country"].stringValue
                let deathCases = json["response"][0]["deaths"]["total"].intValue
                let newDeathCases = json["response"][0]["deaths"]["new"].intValue
                let testsDone = json["response"][0]["tests"]["total"].intValue
                let criticalCases = json["response"][0]["cases"]["critical"].intValue
                let totalCases = json["response"][0]["cases"]["total"].intValue
                let activeCases = json["response"][0]["cases"]["active"].intValue
                let newCases = json["response"][0]["cases"]["new"].intValue
                let recoveredCases = json["response"][0]["cases"]["recovered"].intValue
                
                self.detailedCountryData = DetailedCountryData(country: country, totalCases: totalCases, newCases: newCases, activeCases: activeCases, criticalCases: criticalCases, deathCases: deathCases, newDeathCases: newDeathCases, recoveredCases: recoveredCases, testsDone: testsDone)
            }
        }
    }
}
