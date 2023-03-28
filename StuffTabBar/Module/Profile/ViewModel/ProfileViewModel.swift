//
//  ProfileViewModel.swift
//  StuffTabBar
//
//  Created by Teguh Wibowo Wijaya on 28/03/23.
//

import Foundation

struct ProfileViewModel {
    let profilePoints: [SettingPointModel] = [
        SettingPointModel(settingPointType: .editProfile, systemImageName: "star", pointName: "Edit Profile"),
        SettingPointModel(settingPointType: .changePassword, systemImageName: "star", pointName: "Change Password"),
        SettingPointModel(settingPointType: .history, systemImageName: "star", pointName: "History"),
        SettingPointModel(settingPointType: .about, systemImageName: "star", pointName: "About"),
        SettingPointModel(settingPointType: .logout, systemImageName: "star", pointName: "Logout")
    ]
}
