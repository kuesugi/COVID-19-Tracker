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
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
    }
}
