import Foundation

protocol GFFollowerItemVCDelegate: class {
    func didTapGitFollowers(for user: User)
}


class GFFollowerItemViewController: GFItemInfoViewController {
    
    weak var delegate: GFFollowerItemVCDelegate!
    
    init(user: User, delegate: GFFollowerItemVCDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        delegate.didTapGitFollowers(for: user)
    }
    
}
