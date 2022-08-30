//
//  TokenStorage.swift
//  IOS_Summer_school
//
//
//

import Foundation

protocol TokenStorage {
  
    func getToken() throws -> TokenContainer
    func set(newToken: TokenContainer) throws
}
