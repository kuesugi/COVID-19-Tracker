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
    @State var isSearchVisible = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                if isSearchVisible {
                    SearchView(searchText: $searchText)
                }
                
                TotalDataView(totalData: dataFetch.totalData)
                ListHeaderView()
                
                List {
                    ForEach(dataFetch.allCountriesData.filter {
                        self.searchText.isEmpty ? true : $0.country.lowercased().contains(self.searchText.lowercased())
                    }, id: \.country) { countryData in
                        
                        NavigationLink(destination: CountryDetailView(countryData: countryData)) {
                             CountryDataView(countryData: countryData)
                        }
                    }
                }
            }
            .navigationBarTitle("Recent Data", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.isSearchVisible.toggle()
                    
                    if !self.isSearchVisible {
                        self.searchText = ""
                    }
                }, label: {
                    Image(systemName: "magnifyingglass")
                })
            )
        }
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
    }
}
