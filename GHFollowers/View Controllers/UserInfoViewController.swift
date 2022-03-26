import UIKit

class UserInfoViewController: UIViewController {
    var username: String!
    let followerLabel = GFTitleLabel(textAlignment: .center, fontSize: 24)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTitle()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        NetworkManager.shared.getUserInfo(username: username, completed: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                print(user.avatarUrl)
                break
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Erorr", message: error.rawValue, buttonTitle: "OK")
            }
        })
    }
    
    @objc func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func configureTitle() {
        view.addSubview(followerLabel)
        followerLabel.text = username
        followerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            followerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            followerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            followerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            followerLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}
