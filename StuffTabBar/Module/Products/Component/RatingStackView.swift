//
//  RatingStackView.swift
//  StuffTabBar
//
//  Created by Teguh Wibowo Wijaya on 28/03/23.
//

import UIKit

class RatingStackView: UIStackView {
    
    static let defaultRatingImageHeight: CGFloat = 18
    static let defaultRatingImage = UIImage(systemName: "star")
    private let fullStarImage = UIImage(systemName: "star.fill")
    private let halfStarImage = UIImage(systemName: "star.leadinghalf.filled")
    private let hollowStarImage = UIImage(systemName: "star")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupSelfAttributes() {
        self.distribution = .fill
        self.alignment = .fill
        self.spacing = 0
    }
    
    func createRatings(
        _ rate: Double,
        max: Double = 5.0,
        height: CGFloat = defaultRatingImageHeight
    ) {
//        clearRatingStackView()
        if max <= 1, rate < 0 { return }
        
        var ratings = [UIImageView]()
        
        let intRate = Int(floor(rate))
        let decimalRate = rate.truncatingRemainder(dividingBy: 1)
        
        let intMax = Int(max.rounded(.up))
        print(intRate)
        for index in 1...intMax {
            let ratingImageView = createRatingImageView(height: height)
            
            if intRate + 1 == index {
                ratingImageView.image = getRatingImageOfDecimal(decimalRate)
            } else if index <= intRate {
                print(index)
                ratingImageView.image = fullStarImage
            } else {
                ratingImageView.image = hollowStarImage
            }
            
            ratings.append(ratingImageView)
            self.addArrangedSubview(ratings[index-1])
        }
    }
    
    private func clearRatingStackView() {
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
    }
    
    private func getRatingImageOfDecimal(_ decimal: Double) -> UIImage? {
        switch decimal {
        case 0.0...0.30:
            return hollowStarImage
        case 0.31...0.70:
            return halfStarImage
        case 0.71..<1.0:
            return fullStarImage
        default:
            return hollowStarImage
        }
    }
    
    private func createRatingImageView(
        height: CGFloat,
        image: UIImage? = defaultRatingImage
    ) -> UIImageView {
        let ratingImageView = UIImageView()
        ratingImageView.translatesAutoresizingMaskIntoConstraints = false
        
        ratingImageView.tintColor = .black
        ratingImageView.image = image
        NSLayoutConstraint.activate([
            ratingImageView.heightAnchor.constraint(equalToConstant: height),
            ratingImageView.widthAnchor.constraint(equalToConstant: height)
        ])
        return ratingImageView
    }
}
