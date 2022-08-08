//
//  AppDelegate.swift
//  IOS_Summer_school
//
//  Created by Кирилл Зезюков on 08.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("Приложение запущено")
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .darkGray
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }



    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        //Not ronning -> inactive
        print("Приложение начало запуск")
        return true
    }
    func applicationWillResignActive(_ application: UIApplication) {
        //From active to inactive
        print("Приложение приостановлено")
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        //inactive -> active
        print("Приложение востановило работу (снова активно)")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("Приложение перешло в бекграунд")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("Из бэкграунда снова активно")
    }
    func applicationWillTerminate(_ application: UIApplication) {
        print("Удалено из памяти")
    }
}

