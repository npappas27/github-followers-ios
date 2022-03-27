import UIKit

fileprivate var containerView: UIView!

class DataLoadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func showEmptyStateView(with message: String, in view: UIView) {
        let emptyStateView = GFEmptyStateView(message: message)
        emptyStateView.frame = view.frame
        view.addSubview(emptyStateView)
    }
    
    
    func showLoadingView() {
            containerView = UIView(frame: self.view.bounds)
            self.view.addSubview(containerView)
            containerView.backgroundColor = .systemBackground
            containerView.alpha = 0
            UIView.animate(withDuration: 0.25) {
                containerView.alpha = 0.8
            }
        let activityIndicator = UIActivityIndicatorView(style: .large)
            containerView.addSubview(activityIndicator)
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
                activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
            ])
            activityIndicator.startAnimating()
    }
    
    func removeLoadingView() {
        UIView.animate(withDuration: 0.25) {
            DispatchQueue.main.async {
                containerView.removeFromSuperview()
                containerView = nil
            }
        }
    }

}
