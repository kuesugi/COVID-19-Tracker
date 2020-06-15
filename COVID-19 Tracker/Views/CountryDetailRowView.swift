//
//  CountryDetailRowView.swift
//  COVID-19 Tracker
//
//  Created by Zhaoyi Ma on 6/15/20.
//  Copyright © 2020 Zhaoyi Ma. All rights reserved.
//

import SwiftUI

struct CountryDetailRowView: View {
    
    var number: String = "/"
    var name: String = "Error Name"
    var color: Color = .primary
    
    var body: some View {
        
        VStack {
            HStack {
                Text(self.name)
                    .font(.body)
                    .fontWeight(.medium)
                    .padding(5)
                Spacer()
                Text(self.number)
                    .font(.subheadline)
                    .foregroundColor(self.color)
                    .padding(5)
            }
            Divider()
        }
        .padding(.leading)
        .padding(.trailing)
    }
}
