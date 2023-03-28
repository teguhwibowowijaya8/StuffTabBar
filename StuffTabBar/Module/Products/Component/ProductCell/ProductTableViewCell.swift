//
//  ProductTableViewCell.swift
//  StuffTabBar
//
//  Created by Teguh Wibowo Wijaya on 28/03/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    static let identifier = "ProductTableViewCell"
    

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var shadowView: UIView! {
        didSet {
            shadowView.layer.shadowColor = UIColor.black.cgColor
            shadowView.layer.shadowRadius = 5
            shadowView.layer.shadowOpacity = 0.4
            shadowView.layer.shadowOffset = .zero
            shadowView.layer.borderWidth = 2
        }
    }
    
    @IBOutlet weak var productImageView: UIImageView! {
        didSet {
            productImageView.contentMode = .scaleAspectFit
        }
    }
    
    @IBOutlet weak var productNameLabel: UILabel! {
        didSet {
            productNameLabel.font = .systemFont(ofSize: 14, weight: .heavy)
            productNameLabel.numberOfLines = 2
        }
    }
    
    @IBOutlet weak var productPriceLabel: UILabel! {
        didSet {
            productPriceLabel.font = .systemFont(ofSize: 13, weight: .medium)
        }
    }
    
    @IBOutlet weak var productRatingContainerView: UIView!
    
    @IBOutlet weak var productSoldCountLabel: UILabel! {
        didSet {
            productSoldCountLabel.textColor = .gray
            productSoldCountLabel.font = .systemFont(ofSize: 13)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell() {
        productImageView.image = UIImage(systemName: "person.fill")
        productNameLabel.text = "Jooooo Name"
        productPriceLabel.text = "Rp. 10.000.000"
        productSoldCountLabel.text = "10000 terjual"
        setupRatingContainerView(rate: 3.5)
    }
    
    private func setupRatingContainerView(rate: Double) {
        let ratingStackView = RatingStackView()
        ratingStackView.translatesAutoresizingMaskIntoConstraints = false
        
        productRatingContainerView.addSubview(ratingStackView)
        ratingStackView.createRatings(rate)
        
        NSLayoutConstraint.activate([
            ratingStackView.topAnchor.constraint(equalTo: productRatingContainerView.topAnchor),
            ratingStackView.leftAnchor.constraint(equalTo: productRatingContainerView.leftAnchor),
            ratingStackView.bottomAnchor.constraint(equalTo: productRatingContainerView.bottomAnchor),
            ratingStackView.rightAnchor.constraint(lessThanOrEqualTo: productRatingContainerView.rightAnchor)
        ])
    }
    
}
