//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by Nick Pappas on 3/24/22.
//

import UIKit

class GFAvatarImageView: UIImageView {
    let cache = NetworkManager.shared.cache
    let placeholderImage = UIImage(named: "avatar-placeholder")!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented") // storyboard init
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = self.placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(url: String) {
        
        let cacheKey = NSString(string: url)
        if let image = cache.object(forKey: cacheKey) {
            self.image = image
            return
        }
        
        guard let url = URL(string: url) else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            if let _ = error {
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data  else { return }
            guard let image = UIImage(data: data) else { return }
            self.cache.setObject(image, forKey: cacheKey)
            DispatchQueue.main.async {
                self.image = image
            }
        }
        dataTask.resume()
    }
}
