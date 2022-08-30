//
//  FavoriteViewController.swift
//  IOS_Summer_school
//
//
//

import UIKit

class FavoriteViewController: UIViewController, UIGestureRecognizerDelegate {

    //MARK: - View
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Private Properties
    
    private let model: MainModel = .init()
    
    
    // MARK: - Lifeсyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureApperance()
        configureModel()
        model.loadPosts()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
    
    //MARK: - SearchButton
    @objc func searchButtonTapped(){
        print("searchButtonTappedFavorite")
        let vc = SearchViewController()
        navigationController?.pushViewController(vc, animated: true)
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
// MARK: - Private Methods
private extension FavoriteViewController {
    
    func configureApperance(){
        collectionView.register(UINib(nibName: "\(FavoriteTableViewCell.self)", bundle: .main), forCellWithReuseIdentifier: "\(FavoriteTableViewCell.self)")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 16, right: 16)

    }
    
    func configureModel() {
        model.didItemsUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    
}

// MARK: - UICollection
extension FavoriteViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FavoriteTableViewCell.self)", for: indexPath)
        if let cell = cell as? FavoriteTableViewCell {
            let item = model.items[indexPath.row]
            cell.title = item.title
            cell.isFavorite = item.isFavorite
            cell.imageUrlInString = item.imageUrlInString
            cell.date = item.dateCreation
            cell.text = item.content
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width - 32
        return CGSize(width: width, height: width * 1.18)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.model = model.items[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.items.count
    }
    
}


