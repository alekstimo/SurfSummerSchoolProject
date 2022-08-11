//
//  MainViewController.swift
//  IOS_Summer_school
//
//  
//

import UIKit

final class MainViewController: UIViewController, UIGestureRecognizerDelegate {

    // MARK: - Constants
    private enum Constants {
        static let horisontalInset: CGFloat = 16
        static let spaceBetweenElements: CGFloat = 7
        static let spaceBetweenRows: CGFloat = 8
    }

    // MARK: - Private Properties
    
    private let model: MainModel = .init()

    // MARK: - Views
    @IBOutlet private weak var collectionView: UICollectionView!

    
    
    // MARK: - Lifeсyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureApperance()
        configureModel()
        model.getPosts()
        //model.loadPosts()
        model.items[5].isFavorite = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
    
    //MARK: - SearchButton
//    @IBOutlet weak var SearchButton: UIButton!{
//    didSet{
//    let image = UIImage(named: "SearchButton")
//    SearchButton.setImage(image, for: .normal)
//    SearchButton.setTitle("", for: .normal)
//    }
//    }
   
    
//    @IBAction func SearchButtonPush(_ sender: UIButton) {
//        print("Push main search!")
//        //let vc = SearchViewController()
//        //vc.modalPresentationStyle = .overCurrentContext
//        //self.present(vc,animated: true)
//        //navigationController?.pushViewController(vc, animated: true)
//    }
    
    @objc func searchButtonTapped(){
        print("searchButtonTapped")
        let vc = SearchViewController()
        //vc.modalPresentationStyle = .overCurrentContext
        //self.present(vc,animated: true)
        navigationController?.pushViewController(vc, animated: true)
    }
    

}

// MARK: - Private Methods
private extension MainViewController {

    func configureApperance() {
        //navigationItem.title = "Главная"
        collectionView.register(UINib(nibName: "\(MainItemCollectionViewCell.self)", bundle: .main),
                                forCellWithReuseIdentifier: "\(MainItemCollectionViewCell.self)")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = .init(top: 10, left: 16, bottom: 10, right: 16)
    }

    func configureModel() {
        model.didItemsUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    func configureNavigationBar(){
        navigationItem.title = "Главная"
        let searchButton = UIBarButtonItem(image: UIImage(named: "SearchButton"),
                                         style: .plain, target: self,
                                           action: #selector(self.searchButtonTapped))
        navigationItem.rightBarButtonItem = searchButton
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }

}

// MARK: - UICollection
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MainItemCollectionViewCell.self)", for: indexPath)
        if let cell = cell as? MainItemCollectionViewCell {
            let item = model.items[indexPath.row]
            cell.title = item.title
            cell.isFavorite = item.isFavorite
            cell.image = item.image
            //cell.imageUrlInString = item.imageUrlInString
            cell.didFavoriteTapped = { [weak self] in
                self?.model.items[indexPath.row].isFavorite.toggle()
            }
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (view.frame.width - Constants.horisontalInset * 2 - Constants.spaceBetweenElements) / 2
        return CGSize(width: itemWidth, height: 1.46 * itemWidth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spaceBetweenRows
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spaceBetweenElements
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.model = model.items[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    /*
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     super.prepare(for: segue, sender: sender)
     switch segue.identifier = ""
     let vc = segue.destination as? MainViewController
     */

    /*func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.model = model.items[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }*/

}

