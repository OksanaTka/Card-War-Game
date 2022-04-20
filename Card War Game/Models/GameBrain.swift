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
        let temp = Int.random(in: 1 ..< maxNumber)
        print("temp: \(temp)")
        return temp
    }
    
    
    mutating func getProgress() -> Float{
        gamesPlayed += 1
        
        return Float(gamesPlayed) / Float(gamesTotalAmount)
    }
    
    mutating func getNextCard() -> String{
        let  cardNumber = getRandomNumber(maxNumber: cardsAmount)
        let cardValue = cardScore(cardNumber)
        
        
        if firstPlayer{
            player_1?.player_score += cardValue
            
        }else{
            player_2?.player_score += cardValue
        }
        
        firstPlayer = !firstPlayer
        
        return "poker-\(cardNumber)"
    }
    
    mutating func initPlayers(){
        player_1 = Player("Player 1",getPlayerImage(),0)
        player_2 = Player("Player 2",getPlayerImage(),0)
    }
    
    mutating func getPlayerImage() -> String{
        let imageNumber = getRandomNumber(maxNumber: avatarAmount+1)
        return "avatar-\(imageNumber)"
    }
    
    
    func getWinnerMessage() -> String{
        let score1 = getPlayer1Score()
        let score2 = getPlayer2Score()
        
        if score1 > score2{
            return "\(getPlayer1Name()) WINS!"
        }else if score1 <= score2{
            return "\(getPlayer2Name()) WINS!"
        }else{
            return "Both players WON!"
        }
        
        
            
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
    
    mutating func setPlayer1Name(name :String){
        player_1?.player_name = name.isEmpty ? "Player 1" : name
    }
    
    mutating func setPlayer2Name(name :String){
        player_2?.player_name = name.isEmpty ? "Player 2" :name
    }
    
    
    func cardScore(_ cardNumber : Int) -> Int{
        var cardValue  = cardNumber / 4
        if(cardNumber % 4 == 0){
            cardValue -= 1
        }
        return (cardValue + 2)
    }
}
