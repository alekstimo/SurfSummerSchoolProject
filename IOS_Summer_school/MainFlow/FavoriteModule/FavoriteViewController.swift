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

    @objc func searchButtonTapped(){
        print("searchButtonTappedFavorite")
        let vc = SearchViewController()
        //vc.modalPresentationStyle = .overCurrentContext
        //self.present(vc,animated: true)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    

}
