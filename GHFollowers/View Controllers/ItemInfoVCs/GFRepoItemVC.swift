import UIKit
import WebKit

class GFRepoItemVC: GFItemInfoViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, count: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, count: user.publicGists)
        actionButton.setBackgroundColor(color: .systemPurple, title: "GitHub Profile")
    }

    override func actionButtonTapped() {
        userInfoDelegate.didTapGithubProfile(for: user)
    }
}
