//
//  MainModel.swift
//  IOS_Summer_school
//
//
//

import Foundation
import UIKit

final class MainModel {
    
    //MARK: - Events
    
    var didItemsUpdated: (() -> Void)?
    
    //MARK: - Properties
    var items: [DetailItemModel] = [] {
        didSet {
            didItemsUpdated?()
        }
    }
    
    //MARK: - Methods
    
    func getPosts(){
        items = Array(repeating: DetailItemModel.createDefault(), count: 100)
    }
    
}


