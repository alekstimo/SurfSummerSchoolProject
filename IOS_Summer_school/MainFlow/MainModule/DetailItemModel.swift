//
//  DetailItemModel.swift
//  IOS_Summer_school
//
//  Created by Кирилл Зезюков on 11.08.2022.
//

import Foundation
import UIKit

struct DetailItemModel {
    let image: UIImage?
    let title: String
    var isFavorite: Bool
    let dataCreation: String
    let content: String
    
    static func createDefault()-> DetailItemModel {
        .init(image: UIImage(named: "FatCat"), title: "Толстые коты лечат", isFavorite: false, dataCreation: "09.08.2022", content: "Ученые из Британии провели исследование, в котором установили, что, чем больше масса вашего котика, тем полезнее его влияние на ваше здоровье.\n \nВ период исследования были изучены 20 толстых котиков, масса которых превышает нормальную для их породы, помимо этого, были опрошены простые прохожие, и у 99 из 100 человек наблюдался выброс серотонина при взаимодействии с этими котярами. \n \nЛюбите котиков и будете счастливы!")
    }
    
}
