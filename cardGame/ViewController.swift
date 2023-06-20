//
//  ViewController.swift
//  cardGame
//
//  Created by Sushant Dhakal on 2023-06-19.
//

import UIKit
import AVFoundation

var player:AVAudioPlayer!

class ViewController: UIViewController {

    @IBOutlet weak var cardImageOne: UIImageView!
    @IBOutlet weak var cardImageTwo: UIImageView!
    
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var playerLabelOne: UILabel!
    @IBOutlet weak var playerLabelTwo: UILabel!
    
    var score1 = 0
    var score2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loading the back of the card view
        cardImageOne.image =  UIImage(named:"back")
        cardImageTwo.image =  UIImage(named:"back")

    }

    @IBAction func playPressed(_ sender: UIButton) {

        // randomize the card number after pressing play
        let cardNumberOne = Int.random(in: 2...14)
        let cardNumberTwo = Int.random(in: 2...14)
        
        cardSound()
        cardImageOne.image = UIImage(named: "card" + String(cardNumberOne))
        cardImageTwo.image = UIImage(named: "card" + String(cardNumberTwo))
        
        
        
        
        //updating the players score
        if cardNumberOne > cardNumberTwo {
            score1 += 1
        }else if cardNumberTwo > cardNumberOne{
            score2 += 1
        }
        playerLabelOne.text = String(score1)
        playerLabelTwo.text = String(score2)

        
        
        
        // Reseting the scores of player and Images
        if score1 == 5 {
            headerImage.image = UIImage(named: "playerOne")
            score1 = 0
            score2 = 0
            playWon()
        }else if score2 == 5{
            headerImage.image = UIImage(named: "playerTwo")
            score1 = 0
            score2 = 0
            playWon()

        }else{
            headerImage.image = UIImage(named: "logo")
        }
    }
    
  
    //Sound effects
    
    func cardSound (){
        let url = Bundle.main.url(forResource: "cardSound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    func playWon (){
        let url = Bundle.main.url(forResource: "success", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

