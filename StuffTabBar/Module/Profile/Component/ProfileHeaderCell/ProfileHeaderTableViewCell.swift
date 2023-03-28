//
//  ProfileHeaderTableViewCell.swift
//  StuffTabBar
//
//  Created by Teguh Wibowo Wijaya on 28/03/23.
//

import UIKit

class ProfileHeaderTableViewCell: UITableViewCell {
    
    static let identifier = "ProfileHeaderTableViewCell"
    
    @IBOutlet weak var profileImagesContainerView: UIView! {
        didSet {
            profileImagesContainerView.backgroundColor = Constant.mainPinkColor
        }
    }
    
    @IBOutlet weak var profileImageView: UIImageView! {
        didSet {
            profileImageView.tintColor = .black
            profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
        }
    }
    
    @IBOutlet weak var uploadImageButton: UIButton! {
        didSet {
            uploadImageButton.tintColor = .black
            uploadImageButton.layer.cornerRadius = uploadImageButton.bounds.width / 2
        }
    }
    
    @IBOutlet weak var profileNameLabel: UILabel! {
        didSet {
            profileNameLabel.font = .boldSystemFont(ofSize: 18)
            profileNameLabel.textAlignment = .center
        }
    }
    
    @IBOutlet weak var profileEmailLabel: UILabel! {
        didSet {
            profileEmailLabel.font = .systemFont(ofSize: 14)
            profileEmailLabel.textColor = .gray
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
