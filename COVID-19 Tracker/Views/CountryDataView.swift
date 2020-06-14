//
//  CountryDataView.swift
//  COVID-19 Tracker
//
//  Created by Zhaoyi Ma on 6/13/20.
//  Copyright © 2020 Zhaoyi Ma. All rights reserved.
//

import SwiftUI

struct CountryDataView: View {
    
    var countryData: CountryData
    
    var body: some View {
        
        HStack {
            Text(countryData.country)
                .fontWeight(.medium)
                .font(.subheadline)
                .lineLimit(2)
                .frame(width: 110, alignment: .leading)
            Spacer()
            
            Text(countryData.confirmed.formatNumber())
                .foregroundColor(.orange)
                .font(.subheadline)
                .frame(height: 40)
                .padding(.leading, 5)
            Spacer()
            
            Text(countryData.deaths.formatNumber())
                .frame(width: 50, height: 40, alignment: .center)
                .font(.subheadline)
                .foregroundColor(.red)
                .padding(.leading, 5)
            Spacer()
            
            Text(countryData.recovered.formatNumber())
                .frame(width: 50, height: 40, alignment: .center)
                .font(.subheadline)
                .foregroundColor(.green)
        }
    }
}

struct CountryDataView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDataView(countryData: mockCountryData)
    }
}
