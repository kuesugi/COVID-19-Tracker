//
//  MapContainerView.swift
//  COVID-19 Tracker
//
//  Created by Zhaoyi Ma on 6/24/20.
//  Copyright © 2020 Zhaoyi Ma. All rights reserved.
//

import SwiftUI

struct MapContainerView: View {
    
    @ObservedObject var dataFetch = DataFetchRequest()
    
    
    var body: some View {
        MapView(countryData: $dataFetch.allCountriesData)
    }
}

struct MapContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MapContainerView()
    }
}
