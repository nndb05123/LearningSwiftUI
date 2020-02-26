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

    private func getNewsStock() {
        homeViewModel.pageGetNewsStock += 1
    }
    var body: some View {
        NavigationView {
            VStack {
                Button(action: getNewsStock) {
                    Text("Bấm để tăng page")
                }
                List(homeViewModel.listNewsStock) { news in
                    NewsCellView(news: news)
                .navigationBarTitle("You Trade")
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().previewDevice(PreviewDevice(rawValue: "iPhone Xs Max"))
    }
}
