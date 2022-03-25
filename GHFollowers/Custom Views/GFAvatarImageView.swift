//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by Nick Pappas on 3/24/22.
//

import UIKit

class GFAvatarImageView: UIImageView {
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
    
//    func downloadAvatar(url: String) {
//        
//    }
}
