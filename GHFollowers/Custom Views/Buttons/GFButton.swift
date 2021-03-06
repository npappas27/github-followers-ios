import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        // this gets called when we init using storyboard
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, title: String) {
        self.init(frame: .zero) // ignore frame, we are going to do it with autolayout constraints
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal) // setTitle for normal state
    }
    
    private func configure() {
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false // use auto layout
    }
    
    func setBackgroundColor(color: UIColor, title: String) {
        self.backgroundColor = color
        setTitle(title, for: .normal)
    }
}
