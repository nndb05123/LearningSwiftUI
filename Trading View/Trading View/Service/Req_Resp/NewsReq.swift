//
//  NewsReq.swift
//  Trading View
//
//  Created by Bao Duy on 2/26/20.
//  Copyright © 2020 Bao Duy. All rights reserved.
//

import Foundation

enum NewsResponse {
    case SUCCESS(response: NewsModel)
    case FAIL
}

enum ListNewsResponse {
    case SUCCESS(response: [NewsModel])
    case FAIL
}
