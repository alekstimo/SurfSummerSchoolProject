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
    var items: [ItemModel] = [] {
        didSet {
            didItemsUpdated?()
        }
    }
    
    //MARK: - Methods
    
    func getPosts(){
        items = Array(repeating: ItemModel.createDefault(), count: 100)
    }
    
}

struct ItemModel {
    let image: UIImage?
    let title: String
    var isFavorite: Bool
    let dataCreation: String
    let content: String
    
    static func createDefault()-> ItemModel {
        .init(image: UIImage(named: "FatCat"), title: "Толстые коты лечат", isFavorite: false, dataCreation: "09.08.2022", content: "Ученые из Британии провели исследование, в котором установили, что чем больше масса вашего котика, тем полезнее его влияние на ваше здоровье.\n В период исследования были изучены 20 толстых котиков, масса которых превышает нормальную для их породы, помимо этого, были опрошены простые прохожие, и у 99 из 100 человек наблюдался выброс серотонина при взаимодействии с питомцем. \n Любите котиков и будете счастливы!")
    }
    
}
