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
    
    let headers: HTTPHeaders = [
        "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
        "x-rapidapi-key": apiKey
    ]
    
    init() {
        getAllCountries()
        getCurrentTotal()
    }
    
    func getCurrentTotal() {
        AF.request("https://covid-19-data.p.rapidapi.com/totals?format=undefined", headers: headers).responseJSON { response in
            let result = response.data
            
            if result != nil {
                let json = JSON(result!)
                //print(json)
                
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
        AF.request("https://covid-19-data.p.rapidapi.com/country/all?format=undefined", headers: headers).responseJSON { response in
            
            let result = response.value
            var allCountry: [CountryData] = []
            
            if result != nil {
                let dataDict = result as! [Dictionary<String, AnyObject>]
                
                for countryData in dataDict {
                    let countryName = countryData["country"] as? String ?? "Error"
                    let longitude = countryData["longitude"] as? Double ?? 0.0
                    let latitude = countryData["latitude"] as? Double ?? 0.0
                    let confirmed = countryData["confirmed"] as? Int64 ?? 0
                    let recovered = countryData["recovered"] as? Int64 ?? 0
                    let critical = countryData["critical"] as? Int64 ?? 0
                    let deaths = countryData["deaths"] as? Int64 ?? 0
                    
                    let countryObject = CountryData(country: countryName, confirmed: confirmed, critical: critical, deaths: deaths, recovered: recovered, longitude: longitude, latitude: latitude)
                    
                    allCountry.append(countryObject)
                }
            }
            
            self.allCountriesData = allCountry.sorted(by: { $0.confirmed > $1.confirmed } )
        }
    }
}
