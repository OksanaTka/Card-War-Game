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
    
    @IBOutlet weak var main_LBL_winner: UILabel!
    
    var gameBrain = GameBrain()
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        main_PGB_progress.progress = 0.0
        //scale progressbar
        main_PGB_progress.transform = main_PGB_progress.transform.scaledBy(x: 1, y: 4)
        gameBrain.initPlayers()
        main_IMG_player1.image = #imageLiteral(resourceName: gameBrain.getPlayer1Image())
        main_IMG_player2.image = #imageLiteral(resourceName: gameBrain.getPlayer2Image())
        main_LBL_winner.isHidden = true
    
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
            main_LBL_winner.isHidden = false
            main_LBL_winner.text = gameBrain.getWinnerMessage()
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        let alert = UIAlertController(title: "Players Names", message: "Please enter players names", preferredStyle: .alert)
      
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Player 1 Name"
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Player 2 Name"
        }
        
        alert.addAction(UIAlertAction(title: "Submit", style: .default, handler: { [self, weak alert] (_) in
            if let textField = alert?.textFields?[0], let player1Name = textField.text {
                gameBrain.setPlayer1Name(name: player1Name)
                main_LBL_player1.text = gameBrain.getPlayer1Name()
               
                
              
            }
            
            if let textField = alert?.textFields?[1], let player2Name = textField.text {
                print("name2: \(player2Name)")
                gameBrain.setPlayer2Name(name: player2Name)
                main_LBL_player2.text = gameBrain.getPlayer2Name()
                
            }
        }))
        
        self.present(alert, animated: true, completion: nil)        }
    
    
}

