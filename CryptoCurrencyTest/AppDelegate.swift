//
//  AppDelegate.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //Create Window
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = setupInitialViewController()
        
        window?.makeKeyAndVisible()
        
        return true
    }
    
    
    /// This method configure the first view controller of the app and injects its dependencis
    ///
    /// - Returns: Return the first View Controller of the app
    func setupInitialViewController() -> UIViewController{
        let realm = try! Realm()
        let currencyListVC = CurrencyListVC()
        currencyListVC.configure(withDatabase: realm)
        let navigationVC = UINavigationController(rootViewController: currencyListVC)
        return navigationVC
    }
}

