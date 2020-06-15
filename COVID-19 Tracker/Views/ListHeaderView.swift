//
//  ListHeaderView.swift
//  COVID-19 Tracker
//
//  Created by Zhaoyi Ma on 6/13/20.
//  Copyright © 2020 Zhaoyi Ma. All rights reserved.
//

import SwiftUI

struct ListHeaderView: View {
    
    var body: some View {
        
        HStack {
            Text("Country")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(width: 85, alignment: .leading)
                .padding(.leading, 15)
            Spacer()
            
            Text("Confirmed")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(height: 40)
                .padding(.leading, 5)
            Spacer()
            
            Text("Deaths")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(height: 40)
                .padding(.leading, 5)
            Spacer()
            
            Text("Recovered")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(height: 40)
                .padding(.trailing, 10)
        }
        .background(Color(.lightGray))
    }
    
}
