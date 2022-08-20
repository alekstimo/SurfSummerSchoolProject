//
//  ProfileCityTableViewCell.swift
//  IOS_Summer_school
//
//
//

import UIKit

class ProfileCityTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cityTitle: UILabel!
    @IBOutlet weak var cityText: UILabel!
    
    //MARK: - Properties
    
    var text: String = "" {
        didSet {
            cityText.text = text
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureApperance()
    }

    private func configureApperance() {
        selectionStyle = .none
        cityTitle.font = .systemFont(ofSize: 12)
        cityTitle.textColor = .gray
        cityTitle.text = "Город"
        cityText.font = .systemFont(ofSize: 18)
        cityText.textColor = .black
    }
    
}
