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
        //window?.rootViewController = UIStoryboard(name: "SearchStoryBoard", bundle: .main).instantiateInitialViewController()
    }


}

//extension AppDelegate {
//    static var shared: AppDelegate {
//        return UIApplication.shared.delegate as! AppDelegate
//    }
//    var rootViewController: UI {
//        return window!.rootViewController
//    }
//}

