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
    
    
    @IBOutlet var button: UIButton!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        var image = UIImage()
        
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

