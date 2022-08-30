//
//  ProfileEmailTableViewCell.swift
//  IOS_Summer_school
//
// 
//

import UIKit

class ProfileEmailTableViewCell: UITableViewCell {

    @IBOutlet weak var EmailText: UILabel!
    @IBOutlet weak var EmailTitle: UILabel!
    
    //MARK: - Properties
    
    var text: String = "" {
        didSet {
            EmailText.text = text
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureApperance()
    }

    private func configureApperance() {
        selectionStyle = .none
        EmailTitle.font = .systemFont(ofSize: 12)
        EmailTitle.textColor = .gray
        EmailTitle.text = "Почта"
        EmailText.font = .systemFont(ofSize: 18)
        EmailText.textColor = .black
    }
    
}
