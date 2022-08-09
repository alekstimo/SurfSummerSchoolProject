//
//  AppDelegate.swift
//  IOS_Summer_school
//
//  
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        goToMain()
        return true
    }
    func goToMain(){
        window?.rootViewController = TabBarConfigurator().configure()
    }
    

}

