//
//  HomeView.swift
//  Trading View
//
//  Created by Bao Duy on 2/20/20.
//  Copyright © 2020 Bao Duy. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeViewModel = HomeViewModel()
    var body: some View {
        NavigationView {
            VStack {
                List(homeViewModel.listPined) { news in
                    NewsCellView(news: news)
                .navigationBarTitle("You Trade")
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
