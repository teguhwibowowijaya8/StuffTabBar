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
    
    static let tabBarTitle = "Profile"
    static let tabBarImage = UIImage(systemName: "person.circle.fill")
    
    @IBOutlet weak var profileTableView: UITableView!
    
    private var profileViewModel: ProfileViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViewModel()
        setupTableView()
    }
    
    private func setupViewModel() {
        profileViewModel = ProfileViewModel()
    }
    
    func setupTableView() {
        profileTableView.backgroundColor = Constant.mainPinkColor
        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.separatorStyle = .none
        profileTableView.isUserInteractionEnabled = true
        
        let headerCell = UINib(nibName: ProfileHeaderTableViewCell.identifier, bundle: nil)
        profileTableView.register(headerCell, forCellReuseIdentifier: ProfileHeaderTableViewCell.identifier)
        
        profileTableView.register(ProfileSettingPointTableViewCell.self, forCellReuseIdentifier: ProfileSettingPointTableViewCell.identifier)
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
            return profileViewModel?.profilePoints.count ?? 0
        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch ProfileTableSection(indexPath.section) {
        case .header:
            guard let headerCell = tableView.dequeueReusableCell(withIdentifier: ProfileHeaderTableViewCell.identifier, for: indexPath) as? ProfileHeaderTableViewCell
            else { return UITableViewCell() }
            
            return headerCell
            
            
        case .settings:
            guard let settingPoint = profileViewModel?.profilePoints[indexPath.row],
                let settingPointCell = tableView.dequeueReusableCell(withIdentifier: ProfileSettingPointTableViewCell.identifier, for: indexPath) as? ProfileSettingPointTableViewCell
            else { return UITableViewCell() }
            
            settingPointCell.isUserInteractionEnabled = true
            settingPointCell.delegate = self
            settingPointCell.setupCell(settingPoint: settingPoint)
            
            return settingPointCell
            
            
        case .none:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    
}

extension ProfileViewController: ProfileSettingPointCellDelegate {
    func handleSettingPointSelected(type: SettingPointType) {
        print("selected type \(type)")
    }
}
