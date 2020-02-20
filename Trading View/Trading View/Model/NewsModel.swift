//
//  NewsModel.swift
//  Trading View
//
//  Created by Bao Duy on 2/20/20.
//  Copyright © 2020 Bao Duy. All rights reserved.
//

import Foundation
import ObjectMapper

class NewsModel: Mappable ,Codable,Identifiable {
    var id, sourceNewsId: String?
    var tickerIds: [Int]?
    var thumbnail: ThumbnailModel?
    var vi: ViModel?
    var tags: [String]?
    var publishedTime: Int?
    var slugUrl: String?
    var neIds: String?


    init(id:String?) {
        self.id = id
    }

    required init?(map: Map) {
    }

    func mapping(map: Map) {
        id <- map["id"]
        sourceNewsId <- map["sourceNewsId"]
        tickerIds <- map["tickerIds"]
        thumbnail <- map["thumbnail"]
        vi <- map["vi"]
        tags <- map["tags"]
        publishedTime <- map["publishedTime"]
        slugUrl <- map["slugUrl"]
        neIds <- map["neIds"]
    }
}

class ThumbnailModel: Mappable ,Codable,Identifiable {
    var displayName, filename: String?

    required init?(map: Map) {
    }

    func mapping(map: Map) {
        displayName <- map["displayName"]
        filename <- map["filename"]
    }

}

class ViModel: Mappable ,Codable,Identifiable {
    var title, description, content, attachedDocument: String?

    required init?(map: Map) {
    }

    func mapping(map: Map) {
        title <- map["title"]
        description <- map["description"]
        content <- map["content"]
        attachedDocument <- map["attachedDocument"]
    }
}
