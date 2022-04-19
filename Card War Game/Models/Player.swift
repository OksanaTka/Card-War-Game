//
//  Player.swift
//  Card War Game
//
//  Created by user216397 on 4/19/22.
//

import UIKit
struct Player {
    let player_name : String
    var player_image : String
    var player_score : Int
    
    
    init(_ player_name : String,_ player_image : String,_ player_score : Int) {
        self.player_name = player_name
        self.player_image = player_image
        self.player_score = player_score
    }
}
