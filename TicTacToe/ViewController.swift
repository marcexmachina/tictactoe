//
//  ViewController.swift
//  TicTacToe
//
//  Created by Marc O'Neill on 01/01/2017.
//  Copyright © 2017 marcexmachina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 1 is noughts, 2 is crosses
    var activePlayer = 1
    
    // 0 is empty, 1 is noughts, 2 is crosses
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    let winningCombos = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    var winner = 0
    
    var activeGame = true
    
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var playAgainButton: UIButton!
    

    @IBAction func playAgainPressed(_ sender: Any) {
        gameState = [0,0,0,0,0,0,0,0,0]
        winner = 0
        activeGame = true
        
        for i in 1..<10 {

            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
            }
        }
        
        hideLabels()
    }
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        // Translate tag to position in gameState array
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame{
        
            // Set gameStates active position to be the player who selected the empty position
            
            gameState[activePosition] = activePlayer
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
            }
        }
        
        for combo in winningCombos {
            if gameState[combo[0]] != 0 && gameState[combo[1]] == gameState[combo[0]] && gameState[combo[2]] == gameState[combo[1]] {
                winner = activePlayer == 1 ? 2 : 1
                activeGame = false
                winnerLabel.text = "Player \(winner) wins!"
                
                winnerLabel.isHidden = false
                playAgainButton.isHidden = false
                
                UIView.animate(withDuration: 1, animations: { 
                    self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                })
                
                UIView.animate(withDuration: 2, animations: {
                    self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                })
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        hideLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func hideLabels() {
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
    }

}

