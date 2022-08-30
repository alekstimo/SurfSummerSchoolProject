//
//  UserSettings.swift
//  IOS_Summer_school
//
//
//

import Foundation


final class UserSettings {
    
    private enum SettingsKeys: String {
        case userName
        case password
    }
    
    static var userName: String! {
        get{
            return UserDefaults.standard.string(forKey: SettingsKeys.userName.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.userName.rawValue
            if let name = newValue {
                defaults.set(name, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var password: String! {
        get{
            return UserDefaults.standard.string(forKey: SettingsKeys.password.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.password.rawValue
            if let name = newValue {
                defaults.set(name, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
}
