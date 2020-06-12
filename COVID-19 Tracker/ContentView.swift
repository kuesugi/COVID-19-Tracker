//
//  ContentView.swift
//  COVID-19 Tracker
//
//  Created by Zhaoyi Ma on 6/10/20.
//  Copyright © 2020 Zhaoyi Ma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var dataFetch = DataFetchRequest()
    
    var body: some View {
        Text("\(dataFetch.totalData.confirmed)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
