import UIKit

fileprivate var containerView: UIView!

extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertViewController(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.navigationController?.present(alertVC, animated: true)
        }
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
                activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
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
    
    func showEmptyStateView(with message: String, in view: UIView) {
        let emptyStateView = GFEmptyStateView(message: message)
        emptyStateView.frame = view.frame
        view.addSubview(emptyStateView)
    }
}
