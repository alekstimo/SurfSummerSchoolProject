//
//  AppDelegate.swift
//  IOS_Summer_school
//
//  
//

import UIKit

var isLoadedSucces: Bool = false

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?
    
    
    var tokenStorage: TokenStorage {
        BaseTokenStorage()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        startApplicationProccess()
        return true
    }
    
    func startApplicationProccess() {
        
        runLaunchScreen()
        
        if let tokenContainer = try? tokenStorage.getToken(), !tokenContainer.isExpired {
            goToMain()
        } else {
            let tempCredentials = AuthRequestModel(phone:"+71234567890", password:"qwerty")
            AuthService().perfomLoginRequest(credentials: tempCredentials) { [weak self] result in
                switch result {
                case .success:
                    self?.goToMain()
                case .failure:
                    //TODO: - token was not received
                    break
                }
            }
            //TODO: - auth
        }
        
    }
    
    func runLaunchScreen() {
        let launchScreenViewController = UIStoryboard(name: "LaunchScreen", bundle: .main).instantiateInitialViewController()
        window?.rootViewController = launchScreenViewController
    }
    
    func goToMain(){
        DispatchQueue.main.async {
            self.window?.rootViewController = TabBarConfigurator().configure()
        }
    
    }


}


