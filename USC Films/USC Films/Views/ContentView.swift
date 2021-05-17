//
//  ContentView.swift
//  USC Films
//
//  Created by Key on 2021/4/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home
    enum Tab {
        case search
        case home
        case watchlist
    }
    var body: some View {
        TabView(selection: $selection) {
            Search()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(Tab.search)
            Home()
            .tabItem {
                Label("Home", systemImage: "house")
            }
            .tag(Tab.home)
            
            WatchList()
            .tabItem {
                Label("WatchList", systemImage: "heart")
            }
            .tag(Tab.watchlist)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
