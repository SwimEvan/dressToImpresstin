//
//  ViewController.swift
//  dressToImpresstin
//
//  Created by EVAN MEYER on 8/26/24.
//

import UIKit

class ViewController: UIViewController {
    var counter = 0
       var timer = Timer()
    var ph = ""
    var phGuess = ""
    var theme = ""
    var themeGuess = ""
    var betAmt = 0
    var picPair = 0
    var trueOrFalse = false
    var money = 100;
    var doubleDown = false
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var leftViewImageOutlet: UIImageView!
    
    @IBOutlet weak var rightViewImageOutlet: UIImageView!
    
    @IBOutlet weak var placeHigherTFO: UITextField!
    
    @IBOutlet weak var themeGuessTFO: UITextField!
    
    @IBOutlet weak var moneyLabelO: UILabel!
    
    @IBOutlet weak var betAmountTFO: UITextField!
    
    @IBOutlet weak var leftWinOutlet: UIImageView!
    
    @IBOutlet weak var rightWinOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view.
       roundAction()
        moneyLabelO.text = "\(money)"
    }

    @IBAction func goAction(_ sender: UIButton) {
        
      goActions()
    }
    

    
    
    
    @IBAction func doubleDownAction(_ sender: UIButton) {
       doubleDown = true
        goActions()
        
    }
    
    @objc func timerAction() {
           counter += 1
print(counter)
        if(counter > 5){
            timer.invalidate()
            print("stop timer")
            roundAction()
        }
        
       }
    
    
    
    @objc func roundAction(){
        
        picPair = Int.random(in: 1...10)
        print("\(picPair)")
        if(picPair == 1){
            leftViewImageOutlet.image = UIImage(named: "emo")
            rightViewImageOutlet.image = UIImage(named: "emoGirly")
            ph = "left"
            theme = "emo"
        }
        else if(picPair == 2){
            leftViewImageOutlet.image = UIImage(named: "meme")
            rightViewImageOutlet.image = UIImage(named: "meme2")
            ph = "right"
            theme = "meme"
        }
        else if(picPair == 3){
            leftViewImageOutlet.image = UIImage(named: "kawaii")
            rightViewImageOutlet.image = UIImage(named: "kawaii2")
            ph = "right"
            theme = "kawaii"
        }
        else if(picPair == 4){
            leftViewImageOutlet.image = UIImage(named: "sus")
            rightViewImageOutlet.image = UIImage(named: "sus2")
            ph = "left"
            theme = "sus"
        }
        else if(picPair == 5){
            leftViewImageOutlet.image = UIImage(named: "noob")
            rightViewImageOutlet.image = UIImage(named: "noob2")
            ph = "right"
            theme = "noob"
        }
        else if(picPair == 6){
            leftViewImageOutlet.image = UIImage(named: "preppy")
            rightViewImageOutlet.image = UIImage(named: "preppy2")
            ph = "left"
            theme = "preppy"
        }
        else if(picPair == 7){
            leftViewImageOutlet.image = UIImage(named: "rich")
            rightViewImageOutlet.image = UIImage(named: "rich2")
            ph = "left"
            theme = "rich"
        }
        else if(picPair == 8){
            leftViewImageOutlet.image = UIImage(named: "slender")
            rightViewImageOutlet.image = UIImage(named: "slender2")
            ph = "right"
            theme = "slender"
        }
        else if(picPair == 9){
            leftViewImageOutlet.image = UIImage(named: "barbie")
            rightViewImageOutlet.image = UIImage(named: "barbie2")
            ph = "right"
            theme = "barbie"
        }
        else{
            leftViewImageOutlet.image = UIImage(named: "furry")
            rightViewImageOutlet.image = UIImage(named: "furry2")
            ph = "left"
            theme = "furry"
        }
        
    }
    @objc func goActions(){
        themeGuess = themeGuessTFO.text!
        betAmt = (Int(betAmountTFO.text!)!)
        if(doubleDown == false && betAmt <= money){
            money = money - betAmt
        }
        if(doubleDown == true && (betAmt * 2) <= money){
            money = money - (betAmt * 2)
            doubleDown == false
        }
        moneyLabelO.text = "\(money)"
        phGuess = placeHigherTFO.text!
        if(phGuess == "left" ){
            
            if(ph == "left"){
               
                money = money + (betAmt * 2)
                resultLabel.text = "You win!"
                leftWinOutlet.image = UIImage(named: "crown")
                moneyLabelO.text = "\(money)"
                
                betAmt = 0
            }
            else{
                resultLabel.text = "You lost"
                betAmt = 0
            }
        }
        else if(phGuess == "right"){
            if(ph == "right"){
                resultLabel.text = "You won"
                money = money + (betAmt * 2)
                moneyLabelO.text = "\(money)"
                rightWinOutlet.image = UIImage(named: "crown")
            }
            else{
                resultLabel.text = "You lost"
                
                betAmt = 0
            }
        }
        else{
            resultLabel.text = "Error, Restarting"
        }
        
        timer.invalidate() // just in case this button is tapped multiple times
       
               // start the timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
          
        if(ph == "left"){
            leftWinOutlet.image = UIImage(named: "crowns")
            
        }
        else{
            rightWinOutlet.image = UIImage(named: "crowns")
        }
        
    }
    

    
    
    
    }

