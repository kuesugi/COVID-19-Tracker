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
    
    var body: some View {
        
        VStack {
            // Cases
            Text("Cases")
            .padding(.top, 15)
            
            VStack {
                CountryDetailRowView(number: countryStatsFetchRequest.detailedCountryData?.totalCases.formatNumber()  ?? "Error", name: "Confirmed")
                    .padding(.top)
                CountryDetailRowView(number: "+ " + (countryStatsFetchRequest.detailedCountryData?.newCases.formatNumber()  ?? "Error"), name: "New Confirmed Cases")
                CountryDetailRowView(number: countryStatsFetchRequest.detailedCountryData?.deathCases.formatNumber()  ?? "Error", name: "Deaths", color: .red)
                CountryDetailRowView(number: "+ " +  (countryStatsFetchRequest.detailedCountryData?.newDeathCases.formatNumber()  ?? "Error"), name: "New Death Cases", color: .red)
                CountryDetailRowView(number: countryStatsFetchRequest.detailedCountryData?.activeCases.formatNumber()  ?? "Error", name: "Active")
                CountryDetailRowView(number: countryStatsFetchRequest.detailedCountryData?.criticalCases.formatNumber()  ?? "Error", name: "Critical", color: .yellow)
                CountryDetailRowView(number: countryStatsFetchRequest.detailedCountryData?.recoveredCases.formatNumber()  ?? "Error", name: "Recovered", color: .green)
                CountryDetailRowView(number: countryStatsFetchRequest.detailedCountryData?.testsDone.formatNumber()  ?? "Error", name: "Tests Done")
            }
            .background(Color("cardBackgroundGray"))
            .cornerRadius(9.0)
            .padding()
            
            // Rates
            Text("Rates")
            VStack {
                CountryDetailRowView(number: String(format: "%.2f", countryStatsFetchRequest.detailedCountryData?.fatalityRate ?? 0.0) + "%", name: "Fatality Rate", color: .red)
                .padding(.top)
                CountryDetailRowView(number: String(format: "%.2f", countryStatsFetchRequest.detailedCountryData?.recoverRate ?? 0.0) + "%", name: "Recover Rate", color: .green)
            }
            .background(Color("cardBackgroundGray"))
            .cornerRadius(9.0)
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
}
