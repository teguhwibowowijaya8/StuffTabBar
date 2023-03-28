//
//  SettingModel.swift
//  StuffTabBar
//
//  Created by Teguh Wibowo Wijaya on 28/03/23.
//

import Foundation

enum SettingPointType {
    case editProfile
    case changePassword
    case history
    case about
    case logout
}

struct SettingPointModel {
    let settingPointType: SettingPointType
    let systemImageName: String
    let pointName: String
}
