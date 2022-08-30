//
//  ProfileTelephoneTableViewCell.swift
//  IOS_Summer_school
//
//
//

import UIKit

class ProfileTelephoneTableViewCell: UITableViewCell {
    @IBOutlet weak var telehoneTitle: UILabel!
    @IBOutlet weak var telephoneText: UILabel!
    
    var text: String = "" {
        didSet {
            telephoneText.text = text
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureApperance()
    }

    private func configureApperance() {
        selectionStyle = .none
        telehoneTitle.font = .systemFont(ofSize: 12)
        telehoneTitle.textColor = .gray
        telehoneTitle.text = "Телефон"
        telephoneText.font = .systemFont(ofSize: 18)
        telephoneText.textColor = .black
    }
    
}
