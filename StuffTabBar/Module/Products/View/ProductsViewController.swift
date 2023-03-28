//
//  ProductsViewController.swift
//  StuffTabBar
//
//  Created by Teguh Wibowo Wijaya on 28/03/23.
//

import UIKit

enum ProductsHeaderSection {
    case searchBar
    case products
    case none
    
    init(_ section: Int) {
        switch section {
        case 0:
            self = .searchBar
        case 1:
            self = .products
        default:
            self = .none
        }
    }
}

class ProductsViewController: UIViewController {

    static let tabBarTitle = "Products"
    static let tabBarImage = UIImage(systemName: "magnifyingglass")

    @IBOutlet weak var productsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Products"
        self.view.backgroundColor = .white
        setupTableView()
    }
    
    func setupTableView() {
        productsTableView.delegate = self
        productsTableView.dataSource = self
        productsTableView.separatorStyle = .none
        
        productsTableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        
        let productCell = UINib(nibName: ProductTableViewCell.identifier, bundle: nil)
        productsTableView.register(productCell, forCellReuseIdentifier: ProductTableViewCell.identifier)
    }
}

extension ProductsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch ProductsHeaderSection(section) {
        case .searchBar:
            return 1
        case .products:
            return 10
        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch ProductsHeaderSection(indexPath.section) {
        case .searchBar:
            guard let searchBarCell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell
            else { return UITableViewCell() }
            
            searchBarCell.setupCell()
            
            return searchBarCell
            
            
        case .products:
            
            guard let productCell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as? ProductTableViewCell
            else { return UITableViewCell() }
            
            productCell.setupCell()
            
            return productCell
            
            
        case .none:
            return UITableViewCell()
        }
    }
}
