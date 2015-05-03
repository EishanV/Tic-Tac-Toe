//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Eishan Vijay on 2015-05-01.
//  Copyright (c) 2015 Eishan Vijay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activePlayer = 1 // 1 = x, 2 = o
    
    var gameActive = true
    
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    var winningCombinations = [[0,1,2], [3,4,5], [6,7,8],[0,3,6],[1,4,7],[2,5,8], [0,4,8], [2,4,6]]
    
    @IBOutlet var button: UIButton!
    
    @IBOutlet var gameOver: UILabel!
    
    @IBOutlet var playAgainButton: UIButton!
    
    @IBAction func playAgain(sender: AnyObject) {
        
        activePlayer = 1 // 1 = x, 2 = o
        
        gameActive = true
        
        gameState = [0,0,0,0,0,0,0,0,0]
        
        var button = UIButton()
        
        for (var i = 0; i < 9; i++) {
            button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, forState: .Normal)
        }
        
        gameOver.hidden = true
        playAgainButton.hidden = true
        
        
        gameOver.center = CGPointMake(gameOver.center.x - 400, gameOver.center.y)
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
        
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        
        
        if (gameState[sender.tag] == 0 && gameActive){
            var image = UIImage()
            
            gameState[sender.tag] = activePlayer
            
            if (activePlayer == 1) {
                image = UIImage(named: "cross.png")!
                activePlayer++
            }
            else {
                image = UIImage(named: "nought.png")!
                activePlayer = 1
            }
            
            
            sender.setImage(image, forState: .Normal)
            
            println(sender.tag)
            
            for combination in winningCombinations {
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    var labelText = "Crosses has won!"
                    
                    if gameState[combination[0]] == 2 {
                       labelText = "Noughts has won!"
                    }
                    
                    gameOver.text = labelText
                    
                    gameOver.hidden = false
                    playAgainButton.hidden = false
                    
                    
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        self.gameOver.center = CGPointMake(self.gameOver.center.x + 400, self.gameOver.center.y)
                        
                        self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 400, self.playAgainButton.center.y)
                    })
                    
                    gameActive = false
                }
            }
            
            

        }
        
      }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gameOver.hidden = true
        playAgainButton.hidden = true
        
        
        gameOver.center = CGPointMake(gameOver.center.x - 400, gameOver.center.y)
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}