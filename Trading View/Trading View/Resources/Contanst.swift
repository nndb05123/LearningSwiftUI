//
//  Contanst.swift
//  Trading View
//
//  Created by Bao Duy on 2/20/20.
//  Copyright © 2020 Bao Duy. All rights reserved.
//

import Foundation
class Constant {

    static let TIMER_KEYBOARD = 0.3

    static var indexChildTabSelected:Int = 0
    static var isSelectedScreener:Bool = false

    struct Config {
        static let GOOGLE_SIGNIN_KEY = "754877928699-985c4o6k6i2a6d9ofdhqjlj5h86da8ds.apps.googleusercontent.com"
        static let ZALO_SIGNIN_KEY = "754017407141742742"
        static let APP_SERECT_ZALO = "aGR5lIBVmTbGgO8RUtA7"
    }


    struct DEVICES {
        static let iPhone_5 = "iPhone 5"
        static let iPhone_5S = "iPhone 5S"
        static let iPhone_SE = "iPhone SE"
        static let iPhone_X = "iPhone X"
        static let iPhone_XS = "iPhone XS"
        static let iPhone_XR = "iPhone XR"
        static let iPhone_XSMAX = "iPhone XS Max"
    }


    struct Segue {
    }

    struct StoryBoard {
        static let Main = "Main"
        static let WatchList = "WatchList"
        static let Menu = "Menu"
        static let Chat = "Chat"
        static let Market = "Market"
        static let Screener = "Screener"
    }

    struct Tag {
       static let tagClvHorizotalIndice = 808073618
       static let tagClvHorizotalWatchlist = 808073619

    }

    struct API {
        static let baseHost = "https://youtrade.vn/"
        static let baseHostAPI = "http://api.youtrade.vn/"
        static let getNews = "news"

        static let indicesLastMatched = "Markets/MainIndicesLastMatched"
        static let watchList = "Watchlists/"
        static let newsSource = "NewsSources"
        static let searchStockIndice = "StockScreeners/SearchStock"
        static let defaultWatchListYoutrade = "Watchlists/YouTradeDefaultWatchlist"
        static let createNewWatchList = "Watchlists/saveWatchlistModel"
        static let insertLotWatchList = "WatchlistLots"

        // MARKET
        static let commondityPrice = "Markets?type=commodity-price"
        static let barometer = "Markets/Barometer"
        static let topIndices = "Markets/TopStocks/"
        static let allIndicesByExchange = "Markets/IndicesLastMatchedByExchange"
        static let sectorIndices = "Markets/SectorIndicesLastMatched"
        static let derivativesIndices = "Markets/Derivatives"

        // PROFILE
        static let requestAuthToken = "connect/token"
        static let siguUp = "accounts"
        static let forgotPassword = "accounts/EmailResetPassword"
        static let ResendConfirmEmail = "accounts/ResendConfirmEmail"
        static let userProfile = "accounts/profile"
        static let updateAvatar = "accounts/ChangeProfilePicture"

        //NEWS
        static let newNoLayout = "NoLayout/news/"
    }

    struct VCIndentifier {
        //WATCHLIST
        static let mainWatchList = "WatchListViewController"
        static let listWatchList = "ListWatchListViewController"
        static let detalWatchList = "DetailWatchListViewController"
        static let addStockFromSearch = "AddStockInWatchListVC"


        static let searchStock = "SearchViewController"
        static let popUpDetailNewsVC = "PopupDetailNewsVC"
        //HOME
        static let categoryNews = "CategoryNewsViewController"


        // MENU
        static let login = "LoginViewController"
        static let profile = "ProfileViewController"
        static let setting = "SettingViewController"
        static let upgrade = "UpgradeViewController"

        // MARKET
        static let mainMarket = "MarketViewController"
        // CHAT
        static let mainChat = "ChatViewController"
        // SCREENER
        static let screener = "ScreenerViewController"
        static let optionsFilter = "FilterOptionsViewController"
        static let createScreener = "CreateScreenerViewController"

    }

    struct CellIdentifier{
        static let newsLargeCell = "NewsLargeCell"
        static let newsSmallCell = "SmallNewsCell"
        static let newsMoreCell = "MoreNewsCell"
        static let newsHeaderCell = "HeaderCell"
        static let lblAndLineCell = "LabelAndLineCell"
        static let StockListTbvCell = "StockListTbvCell"
        static let StockTbvCell = "StockTbvCell"

        //Market
        static let MarketControllerCell = "MarketControllerCell"
        static let OverviewMarketClvCell = "OverviewMarketClvCell"

        //DetailWatchList
        static let StockNameTbvCell = "StockNameTbvCell"
        static let StockAddSlotTbvCell = "StockAddSlotTbvCell"
        static let StockActionAddSlotTbvCell = "StockActionAddSlotTbvCell"
        static let DeleteButtonTbvCell = "DeleteButtonTbvCell"
        //ListWatchList
        static let StochWatchListTbvCell = "StochWatchListTbvCell"

        //Menu
        static let UpgradeServiceTbvCell = "UpgradeServiceTbvCell"

        //Compare Stocks
        static let RelatedStockTbvCell = "RelatedStockTbvCell"

       // SCREENER
        static let ScreenerOptionsTagTbvCell = "ScreenerOptionsTagTbvCell"
    }

    struct ID_NEWS_CATEGORY {
        static let exchange = "5c47ee458c8422383c9762ac"
        static let world = "5c47ef398c8422383c9762b0"
        static let realEstate = "5c47ef778c8422383c9762b1"
        static let financeBank = "5c47eee48c8422383c9762ae"
        static let bussiness = "5c47eec08c8422383c9762ad"
        static let market = "5c47ef0c8c8422383c9762af"
    }

    struct Image {
        static let logo = "LogoYoutrade.png"
        static let home_Active = "home_active"
        static let home_disable = "home_disable"
        static let markets_Active = "market_active"
        static let markets_disable = "market_disable"
        static let menu_active = "menu_active"
        static let menu_disable = "menu_disable"
        static let watchlist_active = "watchlist_active"
        static let watchlist_disable = "watchlist_disable"
        static let chat_active = "chat_active"
        static let chat_disable = "chat_disable"
        static let back = "ic_back"
        static let bookmark = "ic_bookmark"
        static let bookmarked = "ic_bookmarked-1"
        static let share = "ic_share"
        static let ic_arrow_up_green = "ic_arrow_up_green"
        static let ic_arrow_down_red = "ic_arrow_down_red"
        static let ic_eye_on = "ic_eye_on"
        static let ic_eye_off = "ic_eye_off"
        static let ic_edit = "ic_edit"
        static let ic_add = "ic_add"
        static let ic_user = "ic_user"
        static let ic_star_yellow = "ic_star_yellow"
        static let ic_search_black = "ic_search_black"
        static let ic_stock_sort_blank = "ic_stock_sort_blank"
        static let ic_stock_sort_down = "ic_stock_sort_down"
        static let ic_stock_sort_up = "ic_stock_sort_up"
        static let ic_arrow_up_black = "ic_arrow_up_black"
        static let ic_arrow_down_black = "ic_arrow_down_black"
        static let avatar_default = "avatar_default"
        static let ic_AddWL = "ic_AddWL"
        static let ic_oval_non_check = "ic_oval_non_check"
        static let ic_oval_checked = "ic_oval_checked"
    }

    struct UserDefault {

        static let authLogin = "authLogin"
    }

    struct NotificationName {

    }

    enum Gender:String{
        case FEMALE = "F",
             MALE = "M"

        var r:String{
            return self.rawValue
        }
    }



    enum CollectionTableViewStockType:String {
        case MARKET = "MARKET",
             WATCHLIST = "WATCHLIST",
             INDICES = "INDICES",
             SCREENER = "SCREENER"

        var r:String{
            return self.rawValue
        }
    }

    struct Preiod {
        static let oneDay = "1d"
        static let oneWeek = "1w"
        static let oneMonth = "1m"
        static let threeMonth = "3m"
        static let sixMonth = "6m"
        static let oneYear = "1y"
        static let fiveYear = "5y"
        static let allTime = "max"

    }

}
