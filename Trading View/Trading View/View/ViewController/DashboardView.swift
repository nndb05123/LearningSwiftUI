//
//  DashboardView.swift
//  Trading View
//
//  Created by Bao Duy on 2/20/20.
//  Copyright © 2020 Bao Duy. All rights reserved.
//

import SwiftUI

struct DashboardView: View {
    @State var selectedView = 0
    @ObservedObject var homeViewModel = HomeViewModel()
    var body: some View {
        TabView (selection: $selectedView) {
            HomeView()
                .tabItem {
                    Image(( selectedView == 0 ? "home_active" : "home_disable"))
                    Text("Home")
            } .tag(0)
            ContentView()
                .tabItem {
                    Image( selectedView == 1 ? "market_active": "market_disable")
                    Text("Market")
                        .font(.headline)
            } .tag(1)
            ContentView()
                .tabItem {
                    Image( selectedView == 2 ? "chat_active": "chat_disable")
                    Text("Chat")
            } .tag(2)
            ContentView()
                .tabItem {
                    Image( selectedView == 3 ? "menu_active": "menu_disable")
                    Text("Menu")
            } .tag(3)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView().previewDevice(PreviewDevice(rawValue: "iPhone Xs Max"))
    }
}
