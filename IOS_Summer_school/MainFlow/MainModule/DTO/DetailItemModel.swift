//
//  DetailItemModel.swift
//  IOS_Summer_school
//
//
//

import Foundation
import UIKit

struct DetailItemModel {
    // MARK: - Internal Properties
        let imageUrlInString: String
        let title: String
        var isFavorite: Bool
        let content: String
        let dateCreation: String

        // MARK: - Initialization
        internal init(imageUrlInString: String, title: String, isFavorite: Bool, content: String, dateCreation: Date) {
            self.imageUrlInString = imageUrlInString
            self.title = title
            self.isFavorite = isFavorite
            self.content = content

            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"

            self.dateCreation = formatter.string(from: dateCreation)
        }
    
    static func createDefault() -> DetailItemModel {
        .init(
            imageUrlInString: "",//UIImage(named: "FatCat"),
            title: "Толстые коты лечат",
            isFavorite: false,
            content: "Ученые из Британии провели исследование, в котором установили, что, чем больше масса вашего котика, тем полезнее его влияние на ваше здоровье.\n \nВ период исследования были изучены 20 толстых котиков, масса которых превышает нормальную для их породы, помимо этого, были опрошены простые прохожие, и у 99 из 100 человек наблюдался выброс серотонина при взаимодействии с этими котярами. \n \nЛюбите котиков и будете счастливы!",
            dateCreation: Date() )
             }
    
}
