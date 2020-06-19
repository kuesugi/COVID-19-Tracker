//
//  CountryDetailView.swift
//  COVID-19 Tracker
//
//  Created by Zhaoyi Ma on 6/15/20.
//  Copyright © 2020 Zhaoyi Ma. All rights reserved.
//

import SwiftUI

struct CountryDetailView: View {
    
    var countryData: CountryData
  
    var body: some View {
        
        VStack {
            
            VStack {
                CountryDetailRowView(number: countryData.confirmed.formatNumber(), name: "Confirmed")
                    .padding(.top)
                CountryDetailRowView(number: countryData.critical.formatNumber(), name: "Critical", color: .orange)
                CountryDetailRowView(number: countryData.recovered.formatNumber(), name: "Recovered", color: .green)
                // to avoid nan number
                CountryDetailRowView(number: countryData.recovered == 0 ? "0.0%" : String(format: "%.2f%%", countryData.recoverRate), name: "Recovered Rate", color: .green)
                CountryDetailRowView(number: countryData.deaths.formatNumber(), name: "Deaths", color: .red)
                CountryDetailRowView(number: countryData.deaths == 0 ? "0.0%" : String(format: "%.2f%%", countryData.fatalityRate), name: "Death Rate", color: .red)
            
            }
            .background(Color("cardBackgroundGray"))
            .cornerRadius(9.0)
            .padding()
            
            Spacer()
        }
        .padding(.top, 60)
        .navigationBarTitle(countryData.country)
    }
}
