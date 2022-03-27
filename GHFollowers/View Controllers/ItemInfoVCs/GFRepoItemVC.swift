import UIKit
import WebKit

protocol GFRepoItemVCDelegate: class {
    func didTapGithubProfile(for user: User)
}

class GFRepoItemVC: GFItemInfoViewController {
    
    weak var repoItemDelegate: GFRepoItemVCDelegate! // delegates need to be weak in order to avoid retain cycle

    
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
        repoItemDelegate.didTapGithubProfile(for: user)
    }
}
