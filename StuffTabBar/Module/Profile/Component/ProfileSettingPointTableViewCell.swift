//
//  ProfileSettingPointTableViewCell.swift
//  StuffTabBar
//
//  Created by Teguh Wibowo Wijaya on 28/03/23.
//

import UIKit

protocol ProfileSettingPointCellDelegate {
    func handleSettingPointSelected(type: SettingPointType)
}

class ProfileSettingPointTableViewCell: UITableViewCell {
    
    static let identifier = "ProfileSettingPointTableViewCell"
    
    var delegate: ProfileSettingPointCellDelegate?
    
    private var settingPointType: SettingPointType = .none
    
    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = Constant.mainPinkColor
        
        return containerView
    }()
    
    private lazy var buttonView: UIButton = {
        let buttonView = UIButton(type: .system)
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.setTitle("", for: .normal)
        buttonView.addTarget(self, action: #selector(onButtonViewSelected), for: .touchUpInside)
        buttonView.backgroundColor = .clear
        
        return buttonView
    }()
    
    private lazy var pointImageView: UIImageView = {
        let pointImageView = UIImageView()
        pointImageView.tintColor = .black
        
        NSLayoutConstraint.activate([
            pointImageView.widthAnchor.constraint(equalToConstant: 15),
            pointImageView.heightAnchor.constraint(equalTo: pointImageView.widthAnchor)
        ])
        
        return pointImageView
    }()
    
    private lazy var pointNameLabel: UILabel = {
       let pointNameLabel = UILabel()
        pointNameLabel.font = .boldSystemFont(ofSize: 14)
        
        return pointNameLabel
    }()
    
    private lazy var buttonSubviewStack: UIStackView = {
       let buttonSubviewStack = UIStackView()
        buttonSubviewStack.translatesAutoresizingMaskIntoConstraints = false
        buttonSubviewStack.axis = .horizontal
        buttonSubviewStack.distribution = .fillProportionally
        buttonSubviewStack.spacing = 12
        
        return buttonSubviewStack
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(settingPoint: SettingPointModel) {
        self.backgroundColor = .white
        
        self.settingPointType = settingPoint.settingPointType
        pointImageView.image = settingPoint.settingPointImage
        pointNameLabel.text = settingPoint.pointName
        
        addSubviews()
        setComponentsConstraints()
    }
    
    private func addSubviews() {
        self.contentView.addSubview(containerView)
        containerView.addSubview(buttonSubviewStack)
        containerView.addSubview(buttonView)
        buttonSubviewStack.addArrangedSubview(pointImageView)
        buttonSubviewStack.addArrangedSubview(pointNameLabel)
    }
    
    private func setComponentsConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            containerView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 20),
            containerView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -20),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),
            
            
            buttonView.topAnchor.constraint(equalTo: containerView.topAnchor),
            buttonView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            buttonView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            buttonView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),

            
            buttonSubviewStack.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            buttonSubviewStack.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10),
            buttonSubviewStack.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10),
            buttonSubviewStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
        ])
    }
    
    @objc func onButtonViewSelected(_ sender: UIButton) {
        print("tes")
        delegate?.handleSettingPointSelected(type: settingPointType)
    }

}
