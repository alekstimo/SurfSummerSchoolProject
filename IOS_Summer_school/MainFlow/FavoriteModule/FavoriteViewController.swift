//
//  FavoriteViewController.swift
//  IOS_Summer_school
//
// 
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var SearchButton: UIButton!{
        didSet{
            let image = UIImage(named: "SearchButton")
            SearchButton.setImage(image, for: .normal)
            SearchButton.setTitle("", for: .normal)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    @IBAction func SearchButtonPush(_ sender: Any) {
        print("Push!")
    }
    
    

}
