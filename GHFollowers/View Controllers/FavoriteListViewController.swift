//
//  FavoritesViewController.swift
//  GHFollowers
//
//  Created by Nick Pappas on 3/23/22.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    var tableView: UITableView!
    var favorites: [Follower] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureTable()
        setupDelegate()
        getFavorites()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getFavorites()
    }
    
    private func configureVC() {
        view.backgroundColor = .systemBackground
        title = "Favorites"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTable() {
        tableView = UITableView()
        view.addSubview(tableView)
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.reuseID)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.frame = view.bounds // does the same as the constraints
        tableView.rowHeight = 80
    }
    
    func getFavorites() {
        PersistenceManager.retrieveFavorites { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let favorites):
                guard !favorites.isEmpty else {
                    self.showEmptyStateView(with: "No favorites?", in: self.view)
                    return
                }
                self.favorites = favorites
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.view.bringSubviewToFront(self.tableView)
                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Error", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
}

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate, FollowerListVCDelegate {
    func didRequestFollowers(for username: String) {
        let followerListVC = FollowerListViewController()
        followerListVC.username = username
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    func setupDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.reuseID) as! FavoriteCell
        cell.set(favorite: favorites[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.favorites.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let userInfoVC = UserInfoViewController()
        userInfoVC.username = favorites[indexPath.row].login
        userInfoVC.followerListDelegate = self
        present(userInfoVC, animated: true, completion: nil)
    }
}
