//
//  ViewController.swift
//  Card War Game
//
//  Created by user216397 on 4/13/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var main_LBL_player1: UILabel!

    @IBOutlet weak var main_IMG_player1: UIImageView!
    
    @IBOutlet weak var main_LBL_player2: UILabel!
    
    @IBOutlet weak var main_IMG_player2: UIImageView!
    
    @IBOutlet weak var main_IMG_card1: UIImageView!
    
    @IBOutlet weak var main_IMG_card2: UIImageView!
    
    @IBOutlet weak var main_LBL_score1: UILabel!
    
    @IBOutlet weak var main_LBL_score2: UILabel!
    
    @IBOutlet weak var main_PGB_progress: UIProgressView!
    
    @IBOutlet weak var main_BTN_start: UIButton!
    var gameBrain = GameBrain()
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        main_PGB_progress.progress = 0.0
        gameBrain.initPlayers()
        
    }
    

    @IBAction func startGame(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(setProgress), userInfo:nil, repeats: true)
        sender.isHidden = true
    }
    
    @objc func setProgress(){
        if gameBrain.isTime(){
            
            let card1 = gameBrain.getNextCard()
            let card2 = gameBrain.getNextCard()
            main_IMG_card1.image = #imageLiteral(resourceName: card1)
            main_IMG_card2.image = #imageLiteral(resourceName: card2)
            main_LBL_score1.text = String(gameBrain.getPlayer1Score())
            main_LBL_score2.text = String(gameBrain.getPlayer2Score())
            main_PGB_progress.progress = gameBrain.getProgress()
        }else{
            timer.invalidate()
        }
        
        
        
    }
    
}

