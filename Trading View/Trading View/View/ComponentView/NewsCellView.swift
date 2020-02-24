//
//  NewsCellView.swift
//  Trading View
//
//  Created by Bao Duy on 2/20/20.
//  Copyright © 2020 Bao Duy. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsCellView: View {
    var news: NewsModel
    var body: some View {
        NavigationLink(destination: DetailView(url: news.slugUrl)) {
                HStack {
                    VStack {
                        WebImage(url: URL(string: "\(Constant.API.baseHostAPI)\(news.thumbnail?.filename ?? "")"))
                            .onSuccess { image, cacheType in
                                // Success
                            }
                            .resizable() // Resizable like SwiftUI.Image
                            .placeholder(Image(systemName: "photo")) // Placeholder Image
                            // Supports ViewBuilder as well
                            .placeholder {
                                Rectangle().foregroundColor(.gray)
                            }
                            .indicator(.activity) // Activity Indicator
                            .animation(.easeInOut(duration: 0.5)) // Animation Duration
                            .transition(.fade) // Fade Transition
                            .frame(width: 150, height: 100, alignment: .center)
                        Text(String(news.publishedTime ?? 0))
                    }
                    VStack {
                        Text("Tài Chính - Ngân Hàng")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                        Text(news.vi?.title ?? "nil")
                    }
            }
        }
    }
}

struct NewsCellView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCellView(news: NewsModel.init(id: "id"))
    }
}
