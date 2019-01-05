//
//  ViewController.swift
//  Brain Workout
//
//  Created by Ranjith Vaddella on 1/27/18.
//  Copyright © 2018 Om. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for i in 0...23 {
            emojiButton[i].setTitle("", for: .normal)
            emojiButton[i].backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
            emojiButton[i].layer.shadowOpacity = 0.3
            emojiButton[i].layer.shadowOffset = CGSize(width: 3.0, height: 1.0)
            emojiButton[i].layer.shadowRadius = 4.0
            
            

        }
        
        tapCounterLabel.text = String(tapCounter)
       // let timeStart = NSDate()
        gameScore.text = "Time"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 
    var emoticon  = ["🐎","🐓","🐪","🦅","🐖","🐫","🐆","🐏","🦆","🦌","🦅","🐅","🦀","🐖","🐎","🐓","🐪","🦌","🐫","🐆","🐏","🦆","🐅","🦀"]
    
    var count = 1
    var tapCounter = 0

    @IBOutlet var emojiButton: [UIButton]!
    
    var indexArray = [100,101]
    var bothButtonsUp = false
    var clearanceArray = [200,201]
    
    
    @IBOutlet weak var gameScore: UILabel!
    @IBOutlet weak var tapCounterLabel: UILabel!
    var timeStart = NSDate()
    @IBAction func touchEmoji(_ sender: UIButton) {
        if clearanceArray.count != 26 {
            tapCounter += 1
            tapCounterLabel.text = String(tapCounter) + " Taps"
            tapCounterLabel.font = UIFont(name: "Chalkboard SE", size: 25.0)
        }
        
        print("\(clearanceArray.count)")
        
        /*if clearanceArray.count == 24 {
       
         let timeEnd = Date().timeIntervalSince(timeStart as Date)
            gameScore.text = String(timeEnd)
            print("\(String(describing: gameScore.text))")
        } else {
            gameScore.text = ""
        }*/
        let buttonIndexNumber = emojiButton.index(of: sender)
        var alreadyCleared = false
        if bothButtonsUp == true {
            emojiButton[indexArray[0]].setTitle("", for: .normal)
            emojiButton[indexArray[0]].backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
            emojiButton[indexArray[1]].setTitle("", for: .normal)
            emojiButton[indexArray[1]].backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
            indexArray[0] = 100
            indexArray[1] = 101
            bothButtonsUp = false
            for i in 0...clearanceArray.count-1 {
                if buttonIndexNumber == clearanceArray[i] {
                    alreadyCleared = true
                }
            }
            if alreadyCleared == false {
                flipButton(withIndexNumber: buttonIndexNumber!, forButton: sender)
                indexArray[0] = buttonIndexNumber!
            } else {
                
            }

            
        } else if indexArray[0] == 100 && bothButtonsUp == false {
            for i in 0...clearanceArray.count-1 {
                if buttonIndexNumber == clearanceArray[i] {
                    alreadyCleared = true
                }
            }
            if alreadyCleared == false {
                    flipButton(withIndexNumber: buttonIndexNumber!, forButton: sender)
                    indexArray[0] = buttonIndexNumber!
            } else {
                
            }
            
        } else if indexArray[0] == buttonIndexNumber {
            flipButton(withIndexNumber: buttonIndexNumber!, forButton: sender)
            indexArray[0] = 100
        } else {
            for i in 0...clearanceArray.count-1 {
                if buttonIndexNumber == clearanceArray[i] {
                    alreadyCleared = true
                }
            }
            if alreadyCleared == false {
                indexArray[1] = buttonIndexNumber!
                flipButton(withIndexNumber: buttonIndexNumber!, forButton: sender)
            }
           
            if indexArray[0] < 24 && indexArray[1] < 24 {
                
                if emojiButton[indexArray[0]].currentTitle == emojiButton[indexArray[1]].currentTitle {
                    emojiButton[indexArray[0]].setTitle("", for: .normal)
                    emojiButton[indexArray[0]].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
                    emojiButton[indexArray[1]].setTitle("", for: .normal)
                    emojiButton[indexArray[1]].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
                    clearanceArray.append(indexArray[0])
                    clearanceArray.append(indexArray[1])
                    indexArray[0] = 100
                    indexArray[1] = 101
                    if clearanceArray.count == 24 {
                        let timeEnd = Date().timeIntervalSince(timeStart as Date)
                        gameScore.text = String(Int(timeEnd)) + " Sec"
                        gameScore.font = UIFont(name: "Chalkboard SE", size: 25.0)
                    }
                    
                } else {
                    bothButtonsUp = true
                }
                
            }
        }
        
    }
    
    func flipButton(withIndexNumber a: Int, forButton b : UIButton) {
        
        if emojiButton[a].currentTitle == "" {
            emojiButton[a].setTitle(emoticon[a], for: .normal)
            emojiButton[a].backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        } else {
            emojiButton[a].setTitle("", for: .normal)
            emojiButton[a].backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        }
        
    }

    
    @IBAction func shakeItLikeSushanth(_ sender: UIButton) {
        
        viewDidLoad()
        tapCounter = 0
        timeStart = NSDate()
        let timeEnd = Date().timeIntervalSince(timeStart as Date)
        print("\(timeEnd)")
        tapCounterLabel.text = String(tapCounter)
        gameScore.text = "Time"
        print("\(timeStart)")

        if count < emoticon.count {
            count += 1
        } else {
            count = 1
        }
        var tempEmoticon = emoticon
        var j = emoticon.count-1
        for _ in 0...emoticon.count-1 {
            if j-count >= 0 {
                emoticon[j]=tempEmoticon[j-count]
                j -= 1
            } else {
                emoticon[j]=tempEmoticon[j-count+tempEmoticon.count]
                j -= 1
            }
        }
        //logic to swap the adjacent elements in the array
        for i in 0...((emoticon.count-1)/2)-1{
            emoticon.swapAt(i*2, i*2+1)
        }
      
        tempEmoticon = emoticon
        clearanceArray = [200,201]
        
    }
}

