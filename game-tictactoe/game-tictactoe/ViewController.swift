//
//  ViewController.swift
//  game-tictactoe
//
//  Created by Ella Götbring on 2022-09-16.
//

import UIKit

class ViewController: UIViewController {
    
    //whose turn it is
    var currentPlayer = 1 // O
    var gameActive = true
    var defaultBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winnerCombo = [
    //columns
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
    //rows
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
    //diagonal
        [0, 4, 8], [2, 4, 6]
    ]
    
    @IBOutlet weak var playagainButton: UIButton!
    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBAction func ox(_ sender: AnyObject)
    {
        //only place one gamepiece at one place
        if (defaultBoard[sender.tag-1] == 0 && gameActive == true){
            //not override current gamepiece placed
            defaultBoard[sender.tag-1] = currentPlayer
            //check who the currentplayer is
            if(currentPlayer == 1){
                sender.setImage(UIImage(named: "button-o"), for: UIControl.State())
                currentPlayer = 2 //change turns
            } else {
                sender.setImage(UIImage(named: "button-x"), for: UIControl.State())
                currentPlayer = 1
            }
            
        }
        
        for combination in winnerCombo
              {
                  if defaultBoard[combination[0]] != 0 && defaultBoard[combination[0]] == defaultBoard[combination[1]] && defaultBoard[combination[1]] == defaultBoard[combination[2]]
                  {
                      //pause game
                      gameActive = false
                      
                      //check who won
                      if defaultBoard[combination[0]] == 1{
                          print("circle")
                          winnerLabel.text = "Circle won!"
                      } else {
                          print("cross")
                          winnerLabel.text = "Cross won!"
                      }
                      
                      //only show when someone has won
                      playagainButton.isHidden = false
                      winnerLabel.isHidden = false
      
        
    }
        }
        
        gameActive = false
        //draw
        for i in defaultBoard{
            if i == 0{
                gameActive = true
                break
            }
        }
        if gameActive == false{
            winnerLabel.text = "draw"
            winnerLabel.isHidden = false
            playagainButton.isHidden = false
        }

    }

    

        @IBAction func playAgain(_ sender: Any) {
            //reset variables
            defaultBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0]
            gameActive = true
            currentPlayer = 1
            playagainButton.isHidden = true
            winnerLabel.isHidden = true

            //reset board
            for i in 1...9 {
                print("inside forloop running")
                let button = view.viewWithTag(i) as! UIButton
                button.setImage(UIImage(named: "white"), for: UIControl.State())
                
            }
            
        }
      
    
      
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
  
