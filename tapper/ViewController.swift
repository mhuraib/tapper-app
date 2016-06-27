//
//  ViewController.swift
//  tapper
//
//  Created by Mohammed Huraib on 6/27/2016 AH.
//  Copyright © 2016 Mohammed Huraib. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Outlets
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var tapperLabel: UIImageView!
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var numberOfTapsTextField: UITextField!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var numberOfTapsLabel: UILabel!
    
    // Properties
    var tapCounter : Int = 0
    var tapLimit : Int = 0
    
    override func viewDidLoad() {
        
        tapButton.hidden=true
        numberOfTapsLabel.hidden=true
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressedPlay(sender: UIButton!) {
        
        if(Int(numberOfTapsTextField.text!) != nil){
            
          self.startGame()
        }
        
        
    }
    
    @IBAction func tapButtonPressed(sender: UIButton!) {
        
        tapCounter=tapCounter+1
        updateTapLabel()
        if isGameOver(){
        restartGame()
        }
        
    }
    func startGame() {
        tapLimit = Int(numberOfTapsTextField.text!)!
        
        playButton.hidden=true
        numberOfTapsTextField.hidden=true
        tapperLabel.hidden=true
        numberOfTapsLabel.hidden=false
        tapButton.hidden=false
    }
    
    func isGameOver()-> Bool {
        if(tapCounter < tapLimit){
            return false
        }else {
            return true
        }
    }
    
    func restartGame() {
        
        numberOfTapsTextField.text=""
        numberOfTapsTextField.placeholder="How many taps to win?"
        
        playButton.hidden=false
        numberOfTapsTextField.hidden=false
        tapperLabel.hidden=false
        
        numberOfTapsLabel.hidden=true
        tapButton.hidden=true
        
        tapCounter=0
        updateTapLabel()
        
    }
    
    func updateTapLabel(){
        numberOfTapsLabel.text="\(tapCounter) TAPS"
    }
    

}

