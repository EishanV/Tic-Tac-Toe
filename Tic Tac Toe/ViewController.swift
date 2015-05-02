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

                    println("We have a winner")
                    gameActive = false
                }
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

