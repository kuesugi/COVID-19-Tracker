//
//  RecentView.swift
//  COVID-19 Tracker
//
//  Created by Zhaoyi Ma on 6/12/20.
//  Copyright © 2020 Zhaoyi Ma. All rights reserved.
//

import SwiftUI

struct RecentView: View {
    
    @ObservedObject var dataFetch = DataFetchRequest()
    @State var searchText = ""
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                ListHeaderView()
                
                List {
                    ForEach(dataFetch.allCountriesData.filter {
                        self.searchText.isEmpty ? true : $0.country.lowercased().contains(self.searchText.lowercased())
                    }, id: \.country) { countryData in
                        
                        CountryDataView(countryData: countryData)
                    }
                }
            }
        }
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
    }
}
