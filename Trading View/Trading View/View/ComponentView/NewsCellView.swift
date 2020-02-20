//
//  NewsCellView.swift
//  Trading View
//
//  Created by Bao Duy on 2/20/20.
//  Copyright © 2020 Bao Duy. All rights reserved.
//

import SwiftUI

struct NewsCellView: View {
    var news: NewsModel
    var body: some View {
        NavigationLink(destination: DetailView(url: news.slugUrl)) {
                HStack {
                    Text(news.vi?.title ?? "nil")
                    Text(news.slugUrl ?? "nil")
            }
        }
    }
}

struct NewsCellView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCellView(news: NewsModel.init(id: "id"))
    }
}
