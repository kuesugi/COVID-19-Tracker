//
//  SearchView.swift
//  COVID-19 Tracker
//
//  Created by Zhaoyi Ma on 6/15/20.
//  Copyright © 2020 Zhaoyi Ma. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField("Country Name ... ", text: $searchText)
            .padding()
        }
        .frame(height: 50)
        .background(Color("cardBackgroundGray"))
    }
}
