//
//  ViewController.swift
//  TicTacToe
//
//  Created by Ernesto Carocca on 2022-11-30.
//

import UIKit

class ViewController: UIViewController {
    
   
    
    let segueToGameViewController = "segueToGameViewControllerView"
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var markerPlayer1X: UILabel!
    
    @IBOutlet weak var markerPlayer2O: UILabel!
    @IBOutlet weak var firstViewLabel: UILabel!
    
    @IBAction func startButton(_ sender: Any) {
        performSegue(withIdentifier: segueToGameViewController, sender: self)
        
    } // sends information from this view to gameViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToGameViewController {
            if let destinationCV = segue.destination as? GameViewController {
                destinationCV.recivingMassage = textField1.text
                destinationCV.recivingMassage2 = textField2.text
                
            }
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
}

