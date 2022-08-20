//
//  ProfileModule.swift
//  IOS_Summer_school
//
//  
//

import Foundation

struct ProfileModel {
    // MARK: - Internal Properties
        let imageUrlInString: String
        let name: String
        let city: String
        let telephone: String
        let email: String
        let information: String

        // MARK: - Initialization
    internal init(imageUrlInString: String, name: String, city: String, telephone: String, email: String, info: String) {
            self.imageUrlInString = imageUrlInString
            self.name = name
            self.city = city
            self.telephone = telephone
            self.email = email
            self.information = info
            //Форматирование телефона?

        }
//    func loadPosts()  {
//
//            pictureService.loadPictures { [weak self] result in
//                switch result {
//                case .success(let pictures):
//                    self?.items = pictures.map { pictureModel in
//                        DetailItemModel(
//                            imageUrlInString: pictureModel.photoUrl,
//                            title: pictureModel.title,
//                            isFavorite: false, // TODO: - Need adding `FavoriteService`
//                            content: pictureModel.content,
//                            dateCreation: pictureModel.date
//                        )
//                    }
//                case .failure(let error):
//
//                    break
//
//                    // TODO: - Implement error state there
//
//                }
//            }
//
//        }
    static func createDefault() -> ProfileModel {
        .init(
            imageUrlInString: "https://bit.ly/3mnUUhB",
            name: "Василий Пупкин",
            city: "Воронеж ",
            telephone:"765432143 ",
            email:"ффф@mail.ru ",
            info: " Я человек")
    }
    
    
}
