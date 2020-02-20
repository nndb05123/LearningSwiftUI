//
//  ReachabilityManager.swift
//  Timetablr
//
//  Created by Mr.Robo on 12/15/19.
//  Copyright © 2019 Timtabl. All rights reserved.
//

import Foundation
import UIKit
protocol ReachabilityManagerDelegate {
    func reachabilityConnectionAvailable()
}
class ReachabilityManager{
    static let instance = ReachabilityManager()
    
    var reachability: Reachability?
    let hostNames = [nil, "google.com", "invalidhost"]
    var hostIndex = 0
    var delegate:ReachabilityManagerDelegate?
    
    func startHost(at index: Int) {
        hostIndex = index
        stopNotifier()
        setupReachability(hostNames[index], useClosures: false)
        startNotifier()
    }
    
    func setupReachability(_ hostName: String?, useClosures: Bool) {
        let reachability: Reachability?
        if let hostName = hostName {
            reachability = try? Reachability(hostname: hostName)
//            hostNameLabel.text = hostName
        } else {
            reachability = try? Reachability()
            //            hostNameLabel.text = "No host name"
        }
        self.reachability = reachability
        //        print("--- set up with host name: \(hostNameLabel.text!)")
        reachability?.whenReachable = { reachability in
            self.updateLabelColourWhenReachable(reachability)
        }
        reachability?.whenUnreachable = { reachability in
            self.updateLabelColourWhenNotReachable(reachability)
        }
        if useClosures {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.startHost(at: (self.hostIndex + 1) % 3)
            }
        } else {
            
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(reachabilityChanged(_:)),
                name: .reachabilityChanged,
                object: reachability
            )
        }
    }
    
    func startNotifier() {
        print("--- start notifier")
        do {
            try reachability?.startNotifier()
        } catch {
            BPStatusBarAlert.bpStatusBarAlert.message(message: "No Connection").messageColor(color: .black).bgColor(color: UIColor().hexStringToUIColor(hex: "#EDEDED")).show()

            return
        }
    }
    
    func stopNotifier() {
        print("--- stop notifier")
        reachability?.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: nil)
        reachability = nil
    }
    
    func updateLabelColourWhenReachable(_ reachability: Reachability) {
        print("\(reachability.description) - \(reachability.connection)")
        if reachability.connection == .wifi || reachability.connection == .cellular {
           // self.networkStatus.textColor = .green
            BPStatusBarAlert.bpStatusBarAlert.hide()
            delegate?.reachabilityConnectionAvailable()
//            ServiceManager.defaults().reConnectApi()
        } else {
            BPStatusBarAlert.bpStatusBarAlert.message(message: "No Connection").messageColor(color: .black).bgColor(color: UIColor().hexStringToUIColor(hex: "#EDEDED")).show()
        }
        
//        self.networkStatus.text = "\(reachability.connection)"
    }
    
    func updateLabelColourWhenNotReachable(_ reachability: Reachability) {
        print("\(reachability.description) - \(reachability.connection)")
        BPStatusBarAlert.bpStatusBarAlert.message(message: "No Connection").messageColor(color: .black).bgColor(color: UIColor().hexStringToUIColor(hex: "#EDEDED")).show()

    }

    @objc func reachabilityChanged(_ note: Notification) {
        let reachability = note.object as! Reachability
        
        if reachability.connection != .unavailable {
            updateLabelColourWhenReachable(reachability)
        } else {
            updateLabelColourWhenNotReachable(reachability)
        }
    }
    
    deinit {
        stopNotifier()
    }
}
