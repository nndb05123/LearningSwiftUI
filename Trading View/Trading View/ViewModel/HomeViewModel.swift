//
//  HomeViewModel.swift
//  Trading View
//
//  Created by Bao Duy on 2/20/20.
//  Copyright © 2020 Bao Duy. All rights reserved.
//

import Foundation
import ObjectMapper

class HomeViewModel : ObservableObject{
    @Published var listPined = [NewsModel]()
    @Published var newsPined:NewsModel?


    init() {
        getPined()
        getNewsStock(page: 1, pageSize: 15)
    }

    func getPined()
    {
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
                self.newsPined = listNews[0]
            }
        }) { (err) in
            print(err)
        }
    }

    func getNewsPined()
    {
        let url = Constant.API.baseHostAPI + Constant.API.getNews

        var body:[String:Any] = [:]
        body["type"] = "pinned"
        body["page"] = 1
        body["pagesize"] = 5
        body["categoryIds"] = []
        body["tickerIds"] = []

        ServiceManager.defaults().requestAlarmofire(method: .post, headers: ServiceManager.defaults().headers(), url: url, params: body, completion: { (data:[[String:Any]]) in
            if data.count != 0 {
                self.listPined = Mapper<NewsModel>().mapArray(JSONArray: data)
                for item in self.listPined {
                    print(item.vi?.title! as Any)
                }
            }
        }) { (err) in
            print(err)
        }
    }

    func getNewsLastest(page: Int,pageSize: Int, arrTags:[String]?)
    {
        let url = Constant.API.baseHostAPI + Constant.API.getNews

        var body:[String:Any] = [:]
        body["type"] = "latest"
        body["page"] = page
        body["pagesize"] = pageSize
        body["categoryIds"] = []
        body["tickerIds"] = []

        ServiceManager.defaults().requestAlarmofire(method: .post, headers: ServiceManager.defaults().headers(), url: url, params: body, completion: { (data:[[String:Any]]) in
            if data.count != 0 {
                self.listPined = Mapper<NewsModel>().mapArray(JSONArray: data)
            }
        }) { (err) in
            print(err)
        }
    }

    func getNewsTopnotable(page: Int,pageSize: Int, arrTags:[String]?)
    {
        let url = Constant.API.baseHostAPI + Constant.API.getNews

        var body:[String:Any] = [:]
        body["type"] = "topnotable"
        body["page"] = page
        body["pagesize"] = pageSize
        body["categoryIds"] = arrTags != nil ? arrTags : []
        body["tickerIds"] = []

        ServiceManager.defaults().requestAlarmofire(method: .post, headers: ServiceManager.defaults().headers(), url: url, params: body, completion: { (data:[[String:Any]]) in
            if data.count != 0 {
                self.listPined = Mapper<NewsModel>().mapArray(JSONArray: data)
            }
        }) { (err) in
            print(err)
        }
    }

    func getNewsStock(page: Int,pageSize: Int)
    {
        let url = Constant.API.baseHostAPI + Constant.API.getNews

        var body:[String:Any] = [:]
        body["type"] = "latest"
        body["page"] = page
        body["pagesize"] = pageSize
        body["categoryIds"] = ["5c47ee458c8422383c9762ac"]
        body["tickerIds"] = []

        ServiceManager.defaults().requestAlarmofire(method: .post, headers: ServiceManager.defaults().headers(), url: url, params: body, completion: { (data:[[String:Any]]) in
            if data.count != 0 {
                self.listPined = Mapper<NewsModel>().mapArray(JSONArray: data)
                for item in self.listPined {
                    print(item.vi?.title ?? "")
                    print(item.slugUrl ?? "")
                }
            }
        }) { (err) in
            print(err)
        }
    }

    func getNewsBussiness(page: Int,pageSize: Int)
    {
        let url = Constant.API.baseHostAPI + Constant.API.getNews

        var body:[String:Any] = [:]
        body["type"] = "latest"
        body["page"] = page
        body["pagesize"] = pageSize
        body["categoryIds"] = ["5c47eec08c8422383c9762ad"]
        body["tickerIds"] = []

        ServiceManager.defaults().requestAlarmofire(method: .post, headers: ServiceManager.defaults().headers(), url: url, params: body, completion: { (data:[[String:Any]]) in
            if data.count != 0 {
                self.listPined = Mapper<NewsModel>().mapArray(JSONArray: data)
            }
        }) { (err) in
            print(err)
        }
    }

    func getNewsBank(page: Int,pageSize: Int)
    {
        let url = Constant.API.baseHostAPI + Constant.API.getNews

        var body:[String:Any] = [:]
        body["type"] = "latest"
        body["page"] = page
        body["pagesize"] = pageSize
        body["categoryIds"] = ["5c47eee48c8422383c9762ae"]
        body["tickerIds"] = []

        ServiceManager.defaults().requestAlarmofire(method: .post, headers: ServiceManager.defaults().headers(), url: url, params: body, completion: { (data:[[String:Any]]) in
            if data.count != 0 {
                self.listPined = Mapper<NewsModel>().mapArray(JSONArray: data)
            }
        }) { (err) in
            print(err)
        }
    }

    func getNewsWorld(page: Int,pageSize: Int)
    {
        let url = Constant.API.baseHostAPI + Constant.API.getNews

        var body:[String:Any] = [:]
        body["type"] = "latest"
        body["page"] = page
        body["pagesize"] = pageSize
        body["categoryIds"] = ["5c47ef398c8422383c9762b0"]
        body["tickerIds"] = []

        ServiceManager.defaults().requestAlarmofire(method: .post, headers: ServiceManager.defaults().headers(), url: url, params: body, completion: { (data:[[String:Any]]) in
            if data.count != 0 {
                self.listPined = Mapper<NewsModel>().mapArray(JSONArray: data)
            }
        }) { (err) in
            print(err)
        }
    }

    func getNewsMarket(page: Int,pageSize: Int)
    {
        let url = Constant.API.baseHostAPI + Constant.API.getNews

        var body:[String:Any] = [:]
        body["type"] = "latest"
        body["page"] = page
        body["pagesize"] = pageSize
        body["categoryIds"] = ["5c47ef0c8c8422383c9762af"]
        body["tickerIds"] = []

        ServiceManager.defaults().requestAlarmofire(method: .post, headers: ServiceManager.defaults().headers(), url: url, params: body, completion: { (data:[[String:Any]]) in
            if data.count != 0 {
                self.listPined = Mapper<NewsModel>().mapArray(JSONArray: data)
            }
        }) { (err) in
            print(err)
        }
    }

    func getNewsRealEstate(page: Int,pageSize: Int)
    {
        let url = Constant.API.baseHostAPI + Constant.API.getNews

        var body:[String:Any] = [:]
        body["type"] = "latest"
        body["page"] = page
        body["pagesize"] = pageSize
        body["categoryIds"] = ["5c47ef0c8c8422383c9762af"]
        body["tickerIds"] = []

        ServiceManager.defaults().requestAlarmofire(method: .post, headers: ServiceManager.defaults().headers(), url: url, params: body, completion: { (data:[[String:Any]]) in
            if data.count != 0 {
                self.listPined = Mapper<NewsModel>().mapArray(JSONArray: data)
            }
        }) { (err) in
            print(err)
        }
    }

}
