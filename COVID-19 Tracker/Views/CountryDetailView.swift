//
//  CountryDetailView.swift
//  COVID-19 Tracker
//
//  Created by Zhaoyi Ma on 6/15/20.
//  Copyright © 2020 Zhaoyi Ma. All rights reserved.
//

import SwiftUI

struct CountryDetailView: View {
    @ObservedObject var countryStatsFetchRequest = CountryStatsFetchRequest()
    
    var countryName: String
    var countryData: CountryData

    var body: some View {
        
        VStack {
            // Cases
            Text("Cases")
                .padding(.top, 15)
                .padding(.bottom, 10)
            
            Text("Data with N/A means it is currently unavailable")
                .font(.caption)
                .padding(.bottom, 5)
            
            VStack {
                CountryDetailRowView(number: countryData.confirmed.formatNumber(), name: "Confirmed")
                    .padding(.top)
                ifDataNA(targetNumber: countryStatsFetchRequest.detailedCountryData?.newCases.formatNumber() ?? "N/A", targetDesc: "New Confirmed Cases", targetColor: .primary)
                CountryDetailRowView(number: countryData.critical.formatNumber(), name: "Critical", color: .orange)
                CountryDetailRowView(number: countryData.recovered.formatNumber(), name: "Recovered", color: .green)
                CountryDetailRowView(number: countryData.deaths.formatNumber(), name: "Deaths", color: .red)
                ifDataNA(targetNumber: countryStatsFetchRequest.detailedCountryData?.newDeathCases.formatNumber() ?? "N/A", targetDesc: "New Death Cases", targetColor: .red)
                ifDataNA(targetNumber: countryStatsFetchRequest.detailedCountryData?.testsDone.formatNumber() ?? "N/A", targetDesc: "Tests Done", targetColor: .primary)
            }
            .background(Color("cardBackgroundGray"))
            .cornerRadius(9.0)
            .padding()
            
            // Rates
            Text("Rates")
            VStack {
                CountryDetailRowView(number: countryData.recovered == 0 ? "0.0%" : String(format: "%.2f%%", countryData.recoverRate), name: "Recovered Rate", color: .green)
                    .padding(.top)
                CountryDetailRowView(number: countryData.deaths == 0 ? "0.0%" : String(format: "%.2f%%", countryData.fatalityRate), name: "Death Rate", color: .red)
            }
            .background(Color("cardBackgroundGray"))
            .cornerRadius(CGFloat(9.0))
            .padding()
            Spacer()
        }
        .padding(.top, 15)
        .navigationBarTitle(countryName)
        .onAppear() {
            self.getStats()
        }
    }
    
    private func getStats() {
        countryStatsFetchRequest.getStatsFor(country: self.countryName.replacingOccurrences(of: " ", with: "-"))
    }
    
    private func ifDataNA(targetNumber: String, targetDesc: String, targetColor: Color) -> some View {
        if targetNumber == "0" {
            return CountryDetailRowView(number: "N/A", name: targetDesc, color: targetColor)
        }
        return CountryDetailRowView(number: "+ " +  targetNumber, name: targetDesc, color: targetColor)
    }
}
