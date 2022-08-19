//
//  DetailTitleTableViewCell.swift
//  IOS_Summer_school
//
//  Created by Кирилл Зезюков on 11.08.2022.
//

import UIKit

class DetailTitleTableViewCell: UITableViewCell {

    //MARK: - View
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private  weak var cartTitleLabel: UILabel!
    
    //MARK: - Properties
    var title: String = "" {
        didSet {
            cartTitleLabel.text = title
        }
    }
    var date: String = "" {
        didSet {
            dateLabel.text = date
        }
    }
    
    //MARK: - UITAbleViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureApperance()
    }

    private func configureApperance() {
        selectionStyle = .none
        cartTitleLabel.font = .systemFont(ofSize: 16)
        cartTitleLabel.textColor = .black
        dateLabel.font = .systemFont(ofSize: 10)
        dateLabel.textColor = .gray
    }
    
}
