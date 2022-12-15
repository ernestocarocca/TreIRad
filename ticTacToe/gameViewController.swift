//
//  gameViewController.swift
//  TicTacToe
//
//  Created by Ernesto Carocca on 2022-11-30.
//

import UIKit

class GameViewController: UIViewController {
    
    var recivingMassage : String?
    var recivingMassage2 : String?
    //var playerOne : Player!
    //var player2 : Player!

    @IBOutlet weak var playerName: UITextField!
    
    @IBOutlet weak var playerName2: UITextField!
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var button5: UIButton!
    
    @IBOutlet weak var button6: UIButton!
    
    @IBOutlet weak var button7: UIButton!
    
    @IBOutlet weak var button8: UIButton!
    
    @IBOutlet weak var button9: UIButton!
    
    @IBOutlet weak var winLabet: UILabel!
    
    @IBOutlet weak var markerTurnlabel: UILabel!
    
    var player1: Player!
    var counter : Int!
    var player2: Player!
    var currentPlayer : Player!
    var array_button : Array<UIButton>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 0
        
        
        // if let recivingMassage = recivingMassage{}
        playerName.text = "\(recivingMassage ?? " ")"
        playerName2.text = "\(recivingMassage2 ?? " " )"
        
        
        
        player1 = Player(name : playerName.text ?? " " , marker : "X",color: .black )
        player2 = Player(name : playerName2.text ?? " " , marker : "O", color: .red)
        
        currentPlayer = player1
        
        
        
        
        
        
    }
    
    // button thats sends informatin från the pressed button
    @IBAction func tryButton(_ sender: UIButton){
        // checks if button is empty when player1 presses
        if (sender.titleLabel?.text == nil) {
            // kollar att  den som spelar är den första spelaren
            if(currentPlayer.marker == player1.marker)
            {
                sender.setTitle("\(currentPlayer.marker)", for: .normal)
                sender.setTitleColor(.black, for: .normal)
                winLabet.text = " \(currentPlayer.marker)"
                winLabet.textColor = currentPlayer.color
                
                
                // sets color if somone wins
                if (checkToWin())
                {
                    // function som meddelar att en av spelare har vunnit och frågar om vill börjar om
                    winAlert()
                    sender.setTitleColor(.black, for: .normal)
                    currentPlayer = player1
                    
                    
                    
                   // checksButtons are ful
                }  else if(checkIfFull()){
                    drawAlert()
                    currentPlayer = player1
                    winLabet.text = " \(currentPlayer.marker)"
                    winLabet.textColor = currentPlayer.color
                    
                }
                
                else  {
                    currentPlayer = player2
                    
                    winLabet.text = " \(currentPlayer.marker)"
                    winLabet.textColor = currentPlayer.color}
            }
            
            
            
            
            else if (currentPlayer.marker == player2.marker) {
                // sets color of text for player 2
                sender.setTitle("\(currentPlayer.marker)", for: .normal)
                sender.setTitleColor(currentPlayer.color, for:.normal )
                
                if (checkToWin()){
                    winAlert()
                    currentPlayer = player1
                    winLabet.text = player1.marker
                    
                    
                }
                else if(checkIfFull()){
                    drawAlert()
                    currentPlayer = player1
                    winLabet.text = " \(currentPlayer.marker)"
                    winLabet.textColor = currentPlayer.color
                    
                }
                
                currentPlayer = player1
                winLabet.text = " \(currentPlayer.marker)"
                winLabet.textColor = currentPlayer.color
                
            }
            
            
        }
        
        
    }
    // checks if board is full(buttons)
    func drawAlert(){
        let alert = UIAlertController(title: " OAVGJORT!", message: "Försöka igen?", preferredStyle: .actionSheet)
        
        // Create the action button
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // sets the board(buttons to nil)
            self.restarGame()
            
         
        }
        
        // Add the action to the alert controller
        alert.addAction(okAction)
        
        // Present the alert to the user
        present(alert, animated: true, completion: nil)
        
        
    }
    
    // give a alert if win
    func winAlert(){
        let alert = UIAlertController(title: "Du vann!", message: "\(currentPlayer.name)", preferredStyle: .actionSheet)
        // resets game if pressed
        let okAction = UIAlertAction(title: "Spela igen?", style: .default) { (action) in
            self.restarGame()
        }
        // Add the action to the alert controller
        alert.addAction(okAction)
        
        // Present the alert to the user
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    // t checks if one of the players wins
    func  checkToWin()  -> Bool {
        
        // horesental check 1-3
        if (button1.titleLabel?.text != nil) {
            if (button1.titleLabel?.text == button2.titleLabel?.text && button2.titleLabel?.text == button3.titleLabel?.text)
            {
                return true
            }
            else if (button1.titleLabel?.text == button4.titleLabel?.text && button4.titleLabel?.text == button7.titleLabel?.text){
                
                return true
                
            }
            else if (button1.titleLabel?.text == button5.titleLabel?.text && button5.titleLabel?.text == button9.titleLabel?.text){
                
                return true
                
            }
            
            
            
        }
        
        
        if (button2.titleLabel?.text != nil){
            if (button2.titleLabel?.text == button5.titleLabel?.text && button5.titleLabel?.text == button8.titleLabel?.text){
                return true
                
                
            }
        }
        if (button3.titleLabel?.text != nil){
            if (button3.titleLabel?.text == button5.titleLabel?.text && button5.titleLabel?.text == button7.titleLabel?.text){
                return true
                
                
            }
            else if (button3.titleLabel?.text == button6.titleLabel?.text && button6.titleLabel?.text == button9.titleLabel?.text){
                
                return true
                
                
            }
        }
        
        
        
        if (button4.titleLabel?.text != nil){
            if (button4.titleLabel?.text == button5.titleLabel?.text && button5.titleLabel?.text == button6.titleLabel?.text){
                
                return true
                
            }
            
            
        }
        
        
        if (button7.titleLabel?.text != nil){
            if (button7.titleLabel?.text == button8.titleLabel?.text && button8.titleLabel?.text == button9.titleLabel?.text){
                return true
            }
            
            
        }
        return false
    }
    
    
    
    
    
    func  checkIfFull() -> Bool {
        array_button = [button1, button2, button3,button4, button5, button6, button7, button8, button9]
       
        
        for buttonCheck in array_button {
            
            if (buttonCheck.title(for: .normal) == nil){
                
                return false
            }
            
        }
        
        return true
        
        
    }
    
    func restarGame() {
        for fullButton in array_button {
            fullButton.titleLabel?.text = nil
            fullButton.setTitle(nil, for: .normal)
            fullButton.setTitleColor(.black, for: .normal)
            winLabet.text = nil
            
            
        }
    }
    
    
    /*
     func playerSwitch(player: Player){
     if(player.marker == player1.marker){
     currentPlayer = player2
     winLabet.text = " \(currentPlayer.marker)"
     winLabet.textColor = currentPlayer.color
     
     print(player.marker)
     
     
     
     if (player.marker == player2.marker) {
     currentPlayer = player1
     winLabet.text = " \(currentPlayer.marker)"
     winLabet.textColor = currentPlayer.color
     
     print(player.marker)
     }
     }else {
     currentPlayer = player1
     currentPlayer = player1
     winLabet.text = " \(currentPlayer.marker)"
     winLabet.textColor = currentPlayer.color
     }
     
     }*/
    
    
}














