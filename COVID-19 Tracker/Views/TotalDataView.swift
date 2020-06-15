//
//  TotalDataView.swift
//  COVID-19 Tracker
//
//  Created by Zhaoyi Ma on 6/13/20.
//  Copyright © 2020 Zhaoyi Ma. All rights reserved.
//

import SwiftUI

struct TotalDataView: View {
    
    var totalData: TotalData
    
    var body: some View {
        VStack {
            HStack {
                TotalDataCard(number: totalData.confirmed.formatNumber(), name: "Confirmed")
                TotalDataCard(number: totalData.recovered.formatNumber(), name: "Recovered", color: .green)
                TotalDataCard(number: totalData.deaths.formatNumber(), name: "Deaths", color: .red)
            }
            HStack {
                TotalDataCard(number: totalData.critical.formatNumber(), name: "Critical", color: .orange)
                TotalDataCard(number: String(format: "%.2f %%", totalData.recoverRate), name: "Recovered Rate", color: .green, nameFont: .subheadline)
                TotalDataCard(number: String(format: "%.2f %%", totalData.fatalityRate), name: "Death Rate", color: .red, nameFont: .subheadline)
            }
        }
        .frame(height: 170)
        .padding(10)
    }
}

struct TotalDataView_Previews: PreviewProvider {
    static var previews: some View {
        TotalDataView(totalData: mockTotalData)
    }
}
