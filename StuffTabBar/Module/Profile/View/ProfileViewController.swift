//
//  ProfileViewController.swift
//  StuffTabBar
//
//  Created by Teguh Wibowo Wijaya on 28/03/23.
//

import UIKit

enum ProfileTableSection {
    case header
    case settings
    case none
    
    init(_ section: Int) {
        switch section {
        case 0:
            self = .header
        case 1:
            self = .settings
        default:
            self = .none
        }
    }
}

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableView()
    }
    
    func setupTableView() {
        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.separatorStyle = .none
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch ProfileTableSection(section) {
        case .header:
            return 1
        case .settings:
            return 1
        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch ProfileTableSection(indexPath.section) {
        case .header:
            return UITableViewCell()
        case .settings:
            return UITableViewCell()
        case .none:
            return UITableViewCell()
        }
    }
}
