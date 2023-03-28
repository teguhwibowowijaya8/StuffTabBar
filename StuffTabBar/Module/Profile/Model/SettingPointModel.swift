//
//  SettingModel.swift
//  StuffTabBar
//
//  Created by Teguh Wibowo Wijaya on 28/03/23.
//

import UIKit

enum SettingPointType: Int {
    case editProfile
    case changePassword
    case history
    case about
    case logout
    case none
    
//    init(_ value: Int) {
//        switch value {
//        case 0:
//            self = .editProfile
//        case 1:
//            self = .changePassword
//        case 2:
//            self = .history
//        case 3:
//            self = .about
//        case 4:
//            self = .logout
//        default:
//            self = .none
//        }
//    }
}

struct SettingPointModel {
    let settingPointType: SettingPointType
    let systemImageName: String
    let pointName: String
    
    var settingPointImage: UIImage? {
        return UIImage(systemName: systemImageName)
    }
}
