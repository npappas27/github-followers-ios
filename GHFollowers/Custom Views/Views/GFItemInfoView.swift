import UIKit

enum ItemInfoType {
    case repos, gists, following, followers
}

class GFItemInfoView: UIView {
    
    let symbolImageView = UIImageView()
    let titleLabel = GFTitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel = GFTitleLabel(textAlignment: .center, fontSize: 14)
    var views: [UIView] = []
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented") // storyboard init
    }
    
    private func configure() {
        views = [symbolImageView, titleLabel, countLabel]
        views.forEach { subview in
            addSubview(subview)
            subview.translatesAutoresizingMaskIntoConstraints = false // could be prob
        }
        
        symbolImageView.contentMode = .scaleAspectFill
        symbolImageView.tintColor = .label
        
        NSLayoutConstraint.activate([
            symbolImageView.topAnchor.constraint(equalTo: self.topAnchor),
            symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolImageView.widthAnchor.constraint(equalToConstant: 20),
            symbolImageView.heightAnchor.constraint(equalTo: symbolImageView.widthAnchor),
            
            titleLabel.centerYAnchor.constraint(equalTo: symbolImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: symbolImageView.bottomAnchor, constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func set(itemInfoType: ItemInfoType, count: Int) {
        switch itemInfoType {
        case .repos:
            self.symbolImageView.image = SFSymbols.repos
            self.titleLabel.text = "Public Repos"
        case .gists:
            self.symbolImageView.image = SFSymbols.gists
            self.titleLabel.text = "Public Gists"
        case .following:
            self.symbolImageView.image = SFSymbols.following
            self.titleLabel.text = "Following"
        case .followers:
            self.symbolImageView.image = SFSymbols.followers
            self.titleLabel.text = "Followers"
        }
        self.countLabel.text = String(count)
    }
}
