//
//  TotalDataCard.swift
//  COVID-19 Tracker
//
//  Created by Zhaoyi Ma on 6/13/20.
//  Copyright © 2020 Zhaoyi Ma. All rights reserved.
//

import SwiftUI

struct TotalDataCard: View {
    
    var number: String = "/"
    var name: String = "Error Name"
    var color: Color = .primary
    var nameFont: Font = .body
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                Text(self.number)
                    .font(.subheadline)
                    .padding(5)
                    .foregroundColor(self.color)
                Text(self.name)
                    .font(self.nameFont)
                    .padding(5)
                    .foregroundColor(self.color)
            }
            .frame(width: geometry.size.width, height: 80, alignment: .center)
            .background(Color("cardBackgroundGray"))
            .cornerRadius(9.0)
        }
    }
}

struct TotalDataCard_Previews: PreviewProvider {
    static var previews: some View {
        TotalDataCard()
    }
}
