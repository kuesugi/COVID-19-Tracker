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
    
    init() {
        
    }
    
    func getCurrentTotal() {
        
        let headers = [
            "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
            "x-rapidapi-key": "eeb30cc8e2mshabfffde6a538b55p1bec62jsnb1538c006eb3"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://covid-19-data.p.rapidapi.com/help/countries?format=json")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        })

        dataTask.resume()
    }
}
