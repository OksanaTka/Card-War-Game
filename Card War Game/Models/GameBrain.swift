//
//  GameBrain.swift
//  Card War Game
//
//  Created by user216397 on 4/19/22.
//

import UIKit

struct GameBrain {
    var player_1 :Player?
    var player_2 : Player?
    var gamesPlayed: Float
    let gamesTotalAmount: Float
    let cardsAmount: Int
    let avatarAmount: Int
    var progress: Float
    var firstPlayer: Bool
    
    init() {
        gamesPlayed = 0
        gamesTotalAmount = 15
        cardsAmount = 53
        avatarAmount = 10
        progress = 0
        firstPlayer = true
    }
    
    func isTime() -> Bool{
        return gamesPlayed < gamesTotalAmount
    }
    
    
    func getRandomNumber(maxNumber:Int) -> Int{
        return Int.random(in: 1 ..< maxNumber)
    }
    
    
    mutating func getProgress() -> Float{
        gamesPlayed += 1
        print(Float(gamesPlayed) / Float(gamesTotalAmount))
        return Float(gamesPlayed) / Float(gamesTotalAmount)
    }
    
    mutating func getNextCard() -> String{
       let  cardValue = getRandomNumber(maxNumber: cardsAmount)
        
        
        if firstPlayer{
            player_1?.player_score += cardValue
        }else{
            player_2?.player_score += cardValue
        }
        
    
        firstPlayer = !firstPlayer
        return "poker-\(cardValue)"
    }
    
    mutating func initPlayers(){
        player_1 = Player("Player 1",getPlayerImage(),0)
        player_2 = Player("Player 2",getPlayerImage(),0)
    }
    
    mutating func getPlayerImage() -> String{
        let imageNumber = getRandomNumber(maxNumber: avatarAmount+1)
        return "avatar-\(imageNumber)"
    }
    
    func getPlayer1Score() -> Int{
        return player_1?.player_score ?? 0
    }
    func getPlayer2Score() -> Int{
        return player_2?.player_score ?? 0
    }
    
    func getPlayer1Name() -> String{
        return player_1?.player_name ?? "Player 1"
    }
    
    func getPlayer2Name() -> String{
        return player_2?.player_name ?? "Player 2"
    }
    func getPlayer1Image() ->String{
        return player_1?.player_image ?? "avatar-0"
    }
    func getPlayer2Image() ->String{
        return player_2?.player_image ?? "avatar-0"
    }
}
