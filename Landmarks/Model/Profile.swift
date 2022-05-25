//
//  Profile.swift
//  Landmarks
//
//  Created by 임성빈 on 2022/05/25.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "User Name")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌸"
        case summer = "🍉"
        case fall = "🍂"
        case winter = "☃️"
        
        var id: String { rawValue }
    }
}
