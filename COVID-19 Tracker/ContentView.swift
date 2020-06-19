//
//  ContentView.swift
//  COVID-19 Tracker
//
//  Created by Zhaoyi Ma on 6/10/20.
//  Copyright © 2020 Zhaoyi Ma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
    var body: some View {
        
        TabView {
            RecentView()
                .tabItem(){
                    Tab(imageName: "chart.bar.fill", text: "Recent")
                }
            .tag(0)
        }
    }
}

private struct Tab: View {
    
    let imageName: String
    let text: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
            Text(text)
        }
    }
}
