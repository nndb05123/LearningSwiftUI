//
//  HomeViewModel.swift
//  Trading View
//
//  Created by Bao Duy on 2/20/20.
//  Copyright © 2020 Bao Duy. All rights reserved.
//

import Foundation
import ObjectMapper
import SSSwiftUILoader

class HomeViewModel : ObservableObject{
    @Published var listNewsStock = [NewsModel]()
    @Published var newsPined:NewsModel?
    @Published var pageGetNewsStock:Int = 0 {
        didSet {
            getNewsStock(page: self.pageGetNewsStock)
        }
    }
    private var homeService = HomeService()


    init() {
        //getPined()
    }

    func getPined() {

        Helper.shared.showLoading()

        homeService.getPined { (response) in
            Helper.shared.hideLoading()
            switch response {
            case .SUCCESS(let newsModel):
                self.newsPined = newsModel
            case .FAIL:
                print("Fail")
            }
        }
    }

    func getNewsStock(page: Int) {

        Helper.shared.showLoading()

        homeService.getNewsStock(page: page, pageSize: 15) { (response) in
            Helper.shared.hideLoading()
            switch response {
            case .SUCCESS(let listNews):
                self.listNewsStock += listNews
            case .FAIL:
                print("Fail")
            }
        }

    }


}
