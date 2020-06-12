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

class DataFetchRequest: ObservableObject {
    @Published var totalData: TotalData = mockTotalData
    @Published var allCountriesData: [CountryData] = []
    
    init() {
        getCurrentTotal()
    }
    
    func getCurrentTotal() {
        
        let headers: HTTPHeaders = [
            "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
            "x-rapidapi-key": apiKey
        ]

        AF.request("https://covid-19-data.p.rapidapi.com/totals?format=undefined", headers: headers).responseJSON { response in
            let result = response.data
            
            if result != nil {
                let json = JSON(result!)
                 print(json)
                
                let confirmed = json[0]["confirmed"].intValue
                let deaths = json[0]["deaths"].intValue
                let recovered = json[0]["recovered"].intValue
                let critical = json[0]["critical"].intValue
            
                self.totalData = TotalData(confirmed: confirmed, critical: critical, deaths: deaths, recovered: recovered)
            } else {
                self.totalData = mockTotalData
            }
        }
    }
    
    func getAllCountries() {
        
    }
}
