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
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        // Translate tag to position in gameState array
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 {
        
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
                print("Player \(winner) wins!")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

