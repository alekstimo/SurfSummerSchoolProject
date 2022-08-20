//
//  ProfileViewController.swift
//  IOS_Summer_school
//
//  
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Views
    private let tableView = UITableView()

    // MARK: - Properties
    var model: ProfileModel = .createDefault()

    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        tableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
    
}
// MARK: - Private Methods
private extension ProfileViewController {

    func configureAppearance() {
        configureTableView()
    }

    func configureNavigationBar() {
        navigationItem.title = "Профиль"
    }

    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        tableView.register(UINib(nibName: "\(ProfileGeneralTableViewCell.self)", bundle: .main),
                           forCellReuseIdentifier: "\(ProfileGeneralTableViewCell.self)")
        tableView.register(UINib(nibName: "\(ProfileTelephoneTableViewCell.self)", bundle: .main),
                           forCellReuseIdentifier: "\(ProfileTelephoneTableViewCell.self)")
        tableView.register(UINib(nibName: "\(ProfileCityTableViewCell.self)", bundle: .main),
                           forCellReuseIdentifier: "\(ProfileCityTableViewCell.self)")
        tableView.register(UINib(nibName: "\(ProfileEmailTableViewCell.self)", bundle: .main),
                           forCellReuseIdentifier: "\(ProfileEmailTableViewCell.self)")
        tableView.dataSource = self
        //tableView.separatorStyle = .none
    }

}

// MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProfileGeneralTableViewCell.self)")
            if let cell = cell as? ProfileGeneralTableViewCell {
                cell.imageUrlInString = model.imageUrlInString
                cell.userName = model.name
                cell.text = model.information
            }
            return cell ?? UITableViewCell()
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProfileTelephoneTableViewCell.self)")
            if let cell = cell as? ProfileTelephoneTableViewCell {
                cell.text = model.telephone
            }
            return cell ?? UITableViewCell()
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProfileCityTableViewCell.self)")
            if let cell = cell as? ProfileCityTableViewCell {
                cell.text = model.city
            }
            return cell ?? UITableViewCell()
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProfileEmailTableViewCell.self)")
            if let cell = cell as? ProfileEmailTableViewCell {
                cell.text = model.email
            }
            return cell ?? UITableViewCell()
            
        default:
            return UITableViewCell()
        }
    }

}
