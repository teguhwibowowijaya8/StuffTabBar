//
//  SearchTableViewCell.swift
//  StuffTabBar
//
//  Created by Teguh Wibowo Wijaya on 28/03/23.
//

import UIKit

protocol SearchTableCellDelegate {
    func handleSearchTextChanged(_ value: String?)
}

class SearchTableViewCell: UITableViewCell {
    
    static let identifier = "SearchTableViewCell"
    
    var delegate: SearchTableCellDelegate?
    
    private let searchPlaceholder = "Search..."
    private let constraintSpacing: CGFloat = 20
    private let searchIconSize: CGFloat = 25
    
    private let searchLeftView: UIView = {
        let searchImage = UIImage(systemName: "magnifyingglass")
        let searchImageView = UIImageView(image: searchImage)
        searchImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let leftView = UIView()
        leftView.addSubview(searchImageView)
        
        let searchIconSize: CGFloat = 25
        
        NSLayoutConstraint.activate([
            searchImageView.widthAnchor.constraint(equalToConstant: searchIconSize),
            searchImageView.heightAnchor.constraint(equalToConstant: searchIconSize),
            
            searchImageView.topAnchor.constraint(greaterThanOrEqualTo: leftView.topAnchor, constant: 10),
            searchImageView.leftAnchor.constraint(equalTo: leftView.leftAnchor, constant: 10),
            searchImageView.rightAnchor.constraint(equalTo: leftView.rightAnchor, constant: -20),
            searchImageView.bottomAnchor.constraint(lessThanOrEqualTo: leftView.bottomAnchor, constant: -10),
            
            searchImageView.centerYAnchor.constraint(equalTo: leftView.centerYAnchor)
        ])
        
        return leftView
    }()
    
    private lazy var searchTextField: UITextField = {
        let searchTextField = UITextField()
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.placeholder = searchPlaceholder
        searchTextField.tintColor = .gray
        
        searchTextField.layer.borderWidth = 1
        searchTextField.layer.borderColor = UIColor.gray.cgColor
        searchTextField.layer.cornerRadius = 10
        searchTextField.clipsToBounds = true
        
        searchTextField.addTarget(self, action: #selector(onSearchValueChanged), for: .editingChanged)
        
        return searchTextField
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupCell() {
        addSubviews()
        setComponentsConstraints()
    }
    
    @objc func onSearchValueChanged(_ sender: UITextField) {
        delegate?.handleSearchTextChanged(sender.text)
    }
    
    private func addSubviews() {
        self.addSubview(searchTextField)
        searchTextField.leftView = searchLeftView
        searchTextField.leftViewMode = .always
    }
    
    private func setComponentsConstraints() {
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: constraintSpacing),
            searchTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: constraintSpacing),
            searchTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -constraintSpacing),
            searchTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -constraintSpacing),
            searchTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
}
