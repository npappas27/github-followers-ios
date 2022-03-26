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
        actionButton.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)
    }
    
    @objc private func buttonPress() {
        print("fug mah")
    }
    
}
