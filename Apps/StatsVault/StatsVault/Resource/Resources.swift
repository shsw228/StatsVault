//
//  Resources.swift
//  StatsVault
//  
//  Created by shsw228 on 2023/09/18
//


import Foundation

enum Resources {
    enum GameList {
        static let title = String(localized: "game-list-title", defaultValue: "GameList", comment: "Title of Game-list View.")
    }
    enum Setting {
        static let title = String(localized: "setting-view-title", defaultValue: "Setting", comment: "Title of Setting View.")
        static let aboutApp = String(localized: "about-app-title", defaultValue: "About StatsVault", comment:"Title of About App View")
    }
}
