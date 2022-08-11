//
//  FavoriteViewController.swift
//  IOS_Summer_school
//
// 
//

import UIKit

class FavoriteViewController: UIViewController, UIGestureRecognizerDelegate {

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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
    
    

}
extension FavoriteViewController {
    
    func configureNavigationBar(){
        navigationItem.title = "Избранное"
        let searchButton = UIBarButtonItem(image: UIImage(named: "SearchButton"),
                                         style: .plain, target: self,
                                           action: #selector(self.searchButtonTapped))
        navigationItem.rightBarButtonItem = searchButton
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
}
