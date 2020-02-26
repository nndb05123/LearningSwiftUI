//
//  HomeService.swift
//  Trading View
//
//  Created by Bao Duy on 2/26/20.
//  Copyright © 2020 Bao Duy. All rights reserved.
//

import Foundation
import ObjectMapper

class HomeService: ServiceManager {

        func getPined(completion: @escaping (NewsResponse) -> Void) {

            let url = Constant.API.baseHostAPI + Constant.API.getNews

            var body:[String:Any] = [:]
            body["type"] = "pinned"
            body["page"] = 1
            body["pagesize"] = 5
            body["categoryIds"] = []
            body["tickerIds"] = []

            ServiceManager.defaults().requestAlarmofire(method: .post, headers: ServiceManager.defaults().headers(), url: url, params: body, completion: { (data:[[String:Any]]) in
                if data.count != 0 {
                    let listNews = Mapper<NewsModel>().mapArray(JSONArray: data)
                    completion(.SUCCESS(response: listNews[0]))
                }
            }) { (err) in
                print(err)
                completion(.FAIL)
            }
        }

    func getNewsLastest(page: Int,pageSize: Int, arrTags:[String]?, completion: @escaping (ListNewsResponse) -> Void) {

        let url = Constant.API.baseHostAPI + Constant.API.getNews

        var body:[String:Any] = [:]
        body["type"] = "latest"
        body["page"] = page
        body["pagesize"] = pageSize
        body["categoryIds"] = []
        body["tickerIds"] = []

        ServiceManager.defaults().requestAlarmofire(method: .post, headers: ServiceManager.defaults().headers(), url: url, params: body, completion: { (data:[[String:Any]]) in
            if data.count != 0 {
                let listNews = Mapper<NewsModel>().mapArray(JSONArray: data)
                completion(.SUCCESS(response: listNews))
            }
        }) { (err) in
            print(err)
            completion(.FAIL)
        }
    }

    func getNewsTopnotable(page: Int,pageSize: Int, arrTags:[String]?, completion: @escaping (ListNewsResponse) -> Void) {

        let url = Constant.API.baseHostAPI + Constant.API.getNews

        var body:[String:Any] = [:]
        body["type"] = "topnotable"
        body["page"] = page
        body["pagesize"] = pageSize
        body["categoryIds"] = []
        body["tickerIds"] = []

        ServiceManager.defaults().requestAlarmofire(method: .post, headers: ServiceManager.defaults().headers(), url: url, params: body, completion: { (data:[[String:Any]]) in
            if data.count != 0 {
                let listNews = Mapper<NewsModel>().mapArray(JSONArray: data)
                completion(.SUCCESS(response: listNews))
            }
        }) { (err) in
            print(err)
            completion(.FAIL)
        }
    }

    func getNewsStock(page: Int,pageSize: Int, completion: @escaping (ListNewsResponse) -> Void) {

        let url = Constant.API.baseHostAPI + Constant.API.getNews

        var body:[String:Any] = [:]
        body["type"] = "latest"
        body["page"] = page
        body["pagesize"] = pageSize
        body["categoryIds"] = ["5c47ee458c8422383c9762ac"]
        body["tickerIds"] = []
        ServiceManager.defaults().requestAlarmofire(method: .post, headers: ServiceManager.defaults().headers(), url: url, params: body, completion: { (data:[[String:Any]]) in
            if data.count != 0 {
                let listNews = Mapper<NewsModel>().mapArray(JSONArray: data)
                completion(.SUCCESS(response: listNews))
            }
        }) { (err) in
            print(err)
            completion(.FAIL)
        }
    }

    func getNewsBussiness(page: Int,pageSize: Int, completion: @escaping (ListNewsResponse) -> Void) {

        let url = Constant.API.baseHostAPI + Constant.API.getNews

        var body:[String:Any] = [:]
        body["type"] = "latest"
        body["page"] = page
        body["pagesize"] = pageSize
        body["categoryIds"] = ["5c47eec08c8422383c9762ad"]
        body["tickerIds"] = []
        ServiceManager.defaults().requestAlarmofire(method: .post, headers: ServiceManager.defaults().headers(), url: url, params: body, completion: { (data:[[String:Any]]) in
            if data.count != 0 {
                let listNews = Mapper<NewsModel>().mapArray(JSONArray: data)
                completion(.SUCCESS(response: listNews))
            }
        }) { (err) in
            print(err)
            completion(.FAIL)
        }
    }

    func getNewsBank(page: Int,pageSize: Int, completion: @escaping (ListNewsResponse) -> Void) {

        let url = Constant.API.baseHostAPI + Constant.API.getNews

        var body:[String:Any] = [:]
        body["type"] = "latest"
        body["page"] = page
        body["pagesize"] = pageSize
        body["categoryIds"] = ["5c47eee48c8422383c9762ae"]
        body["tickerIds"] = []
        ServiceManager.defaults().requestAlarmofire(method: .post, headers: ServiceManager.defaults().headers(), url: url, params: body, completion: { (data:[[String:Any]]) in
            if data.count != 0 {
                let listNews = Mapper<NewsModel>().mapArray(JSONArray: data)
                completion(.SUCCESS(response: listNews))
            }
        }) { (err) in
            print(err)
            completion(.FAIL)
        }
    }

    func getNewsWorld(page: Int,pageSize: Int, completion: @escaping (ListNewsResponse) -> Void) {

        let url = Constant.API.baseHostAPI + Constant.API.getNews

        var body:[String:Any] = [:]
        body["type"] = "latest"
        body["page"] = page
        body["pagesize"] = pageSize
        body["categoryIds"] = ["5c47ef398c8422383c9762b0"]
        body["tickerIds"] = []
        ServiceManager.defaults().requestAlarmofire(method: .post, headers: ServiceManager.defaults().headers(), url: url, params: body, completion: { (data:[[String:Any]]) in
            if data.count != 0 {
                let listNews = Mapper<NewsModel>().mapArray(JSONArray: data)
                completion(.SUCCESS(response: listNews))
            }
        }) { (err) in
            print(err)
            completion(.FAIL)
        }
    }

    func getNewsMarket(page: Int,pageSize: Int, completion: @escaping (ListNewsResponse) -> Void) {

        let url = Constant.API.baseHostAPI + Constant.API.getNews

        var body:[String:Any] = [:]
        body["type"] = "latest"
        body["page"] = page
        body["pagesize"] = pageSize
        body["categoryIds"] = ["5c47ef0c8c8422383c9762af"]
        body["tickerIds"] = []
        ServiceManager.defaults().requestAlarmofire(method: .post, headers: ServiceManager.defaults().headers(), url: url, params: body, completion: { (data:[[String:Any]]) in
            if data.count != 0 {
                let listNews = Mapper<NewsModel>().mapArray(JSONArray: data)
                completion(.SUCCESS(response: listNews))
            }
        }) { (err) in
            print(err)
            completion(.FAIL)
        }
    }

    func getNewsRealEstate(page: Int,pageSize: Int, completion: @escaping (ListNewsResponse) -> Void) {

        let url = Constant.API.baseHostAPI + Constant.API.getNews

        var body:[String:Any] = [:]
        body["type"] = "latest"
        body["page"] = page
        body["pagesize"] = pageSize
        body["categoryIds"] = ["5c47ef0c8c8422383c9762af"]
        body["tickerIds"] = []
        ServiceManager.defaults().requestAlarmofire(method: .post, headers: ServiceManager.defaults().headers(), url: url, params: body, completion: { (data:[[String:Any]]) in
            if data.count != 0 {
                let listNews = Mapper<NewsModel>().mapArray(JSONArray: data)
                completion(.SUCCESS(response: listNews))
            }
        }) { (err) in
            print(err)
            completion(.FAIL)
        }
    }

}

