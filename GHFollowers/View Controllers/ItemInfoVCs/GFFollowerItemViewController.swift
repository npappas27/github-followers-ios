import Foundation

class GFFollowerItemViewController: GFItemInfoViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, count: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, count: user.following)
        actionButton.setBackgroundColor(color: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        guard user.followers > 0 else {
            presentGFAlertOnMainThread(title: "No followers", message: "This user doesn't have any followers", buttonTitle: "OK")
            return
        }
        userInfoDelegate.didTapGitFollowers(for: user)
    }
    
}
