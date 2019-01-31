//
//  ViewController.swift
//  fbMessenger
//
//  Created by Dimitry on 1/31/19.
//  Copyright © 2019 dksky. All rights reserved.
//

import UIKit
import SnapKit

class FriendsVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "friendsCellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Recent"
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = true
        collectionView.register(FriendCell.self, forCellWithReuseIdentifier: cellId)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }

}


class FriendCell: BaseCell {
    
    let profileImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 34
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let dividerLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Friends name"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Your friend's message and something else..."
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "12:05 pm"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override func setupViews() {
        addSubview(profileImageView)
        addSubview(dividerLine)
        setupContainerView()
        
        profileImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.height.width.equalTo(68)
            make.centerY.equalToSuperview()
        }
        
        dividerLine.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(82)
            make.height.equalTo(1)
            make.right.bottom.equalToSuperview()
            
        }
    }
    
    private func setupContainerView(){
        let containerView = UIView()
        
        addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(90)
            make.height.equalTo(50)
            make.centerY.right.equalToSuperview()
        }
        
        containerView.addSubview(nameLabel)
        containerView.addSubview(messageLabel)
        containerView.addSubview(timeLabel)
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview()
            make.right.equalTo(timeLabel.snp.left)
            make.height.equalTo(24)
        }
        
        messageLabel.snp.makeConstraints { (make) in
            make.left.width.bottom.equalToSuperview()
            make.right.equalToSuperview().inset(12)
            make.height.equalTo(24)
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.width.equalTo(80)
            make.height.equalTo(20)
            make.top.right.equalToSuperview()
        }
        
    }

}

class BaseCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {}
}


