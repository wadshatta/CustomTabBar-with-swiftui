//
//  ContentView.swift
//  CustomTabBar
//
//  Created by MacBook Pro on 05/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var  TabSelection =  1
    var body: some View {
        TabView(selection: $TabSelection) {
            Text("Tab Content 1")
                .tag(1)
            Text("Tab Content 2")
                .tag(2)
            Text("Tab Content 3")
                .tag(3)
            Text("Tab Content 4")
                .tag(4)
            Text("Tab Content 5")
                .tag(5)
            
        }
        .overlay(alignment:.bottom ){
            CustomTabView(TabSelection: $TabSelection)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
