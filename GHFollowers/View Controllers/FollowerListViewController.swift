//
//  FollowerListViewController.swift
//  GHFollowers
//
//  Created by Nick Pappas on 3/24/22.
//

import UIKit

class FollowerListViewController: UIViewController {
    
    var username: String!
    var requestURL: String =  "https://api.github.com/users/" //npappas27
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
        
        fetchData()
    }
    
    func fetchData() {
        let url = URL(string: (requestURL + username))
        let dataTask = URLSession.shared.dataTask(with: url!) { data, _, error in
            guard let data = data else { return }
            print(data)
        }
        dataTask.resume()
    }

}
