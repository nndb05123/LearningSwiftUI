//
//  Helper.swift
//  Trading View
//
//  Created by Bao Duy on 2/24/20.
//  Copyright © 2020 Bao Duy. All rights reserved.
//

import Foundation
import SSSwiftUILoader
import SwiftUI

struct CustomConfig: LoaderConfiguration {
    var loaderBackgroundColor: Color = Color(UIColor(red:0.51, green:0.93, blue:0.93, alpha:1.0))
    var loaderTextColor: Color = .red
    var loaderCornerRadius: CGFloat =  20.0
    var loaderWindowColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 0.5)
    var activityIndicatorColor: UIColor = .white
    var activityIndicatorStyle: UIActivityIndicatorView.Style = .medium
}

class Helper {
    static let shared = Helper()
    private init() { }
    func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }
    func showLoading() {
        SSLoader.shared.startloader("Loading...",config: .customSettings(config: CustomConfig()))
    }

    func hideLoading() {
        SSLoader.shared.stopLoader()
    }

}
