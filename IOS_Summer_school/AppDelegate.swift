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
//    @objc func searchButtonTapped(){
//        print("searchButtonTapped")
//        let vc = SearchViewController()
//        //vc.modalPresentationStyle = .overCurrentContext
//        //self.present(vc,animated: true)
//        print(window?.rootViewController?.navigationController)
//        window?.rootViewController?.navigationController?.pushViewController(vc, animated: true)
//    }

}

//extension AppDelegate {
//    static var shared: AppDelegate {
//        return UIApplication.shared.delegate as! AppDelegate
//    }
//    var rootViewController: UI {
//        return window!.rootViewController
//    }
//}

