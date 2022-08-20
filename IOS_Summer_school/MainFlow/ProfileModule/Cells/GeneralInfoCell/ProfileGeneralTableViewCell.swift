//
//  ProfileGeneralTableViewCell.swift
//  IOS_Summer_school
//
//
//

import UIKit

class ProfileGeneralTableViewCell: UITableViewCell {

    @IBOutlet private weak var profileImage: UIImageView!
    @IBOutlet private weak var information: UILabel!
    @IBOutlet private weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureApperance()
    }

    //MARK: - properties
    var userName: String = "" {
        didSet {
            name.text = userName
        }
    }
    
    var imageUrlInString: String = "" {
           didSet {
               guard let url = URL(string: imageUrlInString) else {
                   return
               }
               profileImage.loadImage(from: url)
           }
       }
    
    
    var text: String = "" {
        didSet {
            information.text = text
        }
    }
    
}

//MARK: - Private Methods
private extension ProfileGeneralTableViewCell {
    func configureApperance() {
        selectionStyle = .none
        name.textColor = .black
        name.font = .systemFont(ofSize: 18)
        
        profileImage?.layer.cornerRadius = 12
        profileImage?.contentMode = .scaleAspectFill
        
       
        information.textColor = .gray
        information.font = .systemFont(ofSize: 12)
        
    }
}
