//
//  GameViewController.swift
//  TapNumber
//
//  Created by チップまん on 2020/09/27.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
        
    @IBOutlet var countlabel: UILabel!
    @IBOutlet var scoreLabel :UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var button5: UIButton!
    @IBOutlet var button6: UIButton!
    @IBOutlet var button7: UIButton!
    @IBOutlet var button8: UIButton!
    @IBOutlet var button9: UIButton!
    
    var count: Float = 15.0
    var time: Timer = Timer()
    var score: Int = 0
    var currentNumber: Int = -1
    var numberArray:[Int] = [0,1,2,3,4,5,6,7,8]
    let defaults: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

           // Do any additional setup after loading the view.
       }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        }
        
    override func viewWillAppear(_ animated: Bool) {
    count = 15.0
    currentNumber = -1
    score = 0
    scoreLabel.text = String(score)
    if !time.isValid {
        time = Timer.scheduledTimer(timeInterval: 0.01,
                                        target: self,
                                        selector: #selector(self.down),
                                        userInfo: nil,
                                        repeats: true)
        self.reset()

        }
    }
    
  @objc func down(){
    if count > 0.00 {count = count-0.01
        timeLabel.text = String(format: "%.2f", count)
    }else if time.isValid{
        time.invalidate()
        count = 0.00
        timeLabel.text = String(format: "%.2f", count)
        self.performSegue(withIdentifier: "toResult", sender: nil)
        
            let RankLabel1: Int = defaults.integer(forKey: "score1")
            let RankLabel2: Int = defaults.integer(forKey: "score2")
            let RankLabel3: Int = defaults.integer(forKey: "score3")
                
            if score > RankLabel1{
                defaults.set(score, forKey:"score1")
                defaults.set(RankLabel1, forKey:"score2")
                defaults.set(RankLabel2, forKey: "score3")
            } else if score > RankLabel2{
                defaults.set(score, forKey:"score2")
                defaults.set(RankLabel2, forKey: "score3")
            } else if score > RankLabel3{
                defaults.set(score, forKey:"score3")
            }
                
            defaults.synchronize()
        }
    }
    
    func order(number: Int){
        
        if numberArray[number] == currentNumber+1{
            currentNumber = currentNumber + 1
            score += 10
            scoreLabel.text = String(score)
        }
 
        if numberArray[number] == 8&&currentNumber == 7{
            currentNumber = -1
            count = count + 2.00
            self.reset()
        }
    }
    
    @IBAction func number1(){
        self.order(number: 0)
    }
    
    @IBAction func number2(){
        self.order(number: 1)
    }
    
    @IBAction func number3(){
        self.order(number: 2)
    }
    
    @IBAction func number4(){
        self.order(number: 3)
    }
    
    @IBAction func number5(){
        self.order(number: 4)
    }
    
    @IBAction func number6(){
        self.order(number: 5)
    }
    
    @IBAction func number7(){
        self.order(number: 6)
    }
    
    @IBAction func number8(){
        self.order(number: 7)
    }
    
    @IBAction func number9(){
        self.order(number: 8)
    }
    
    func reset(){
        numberArray.shuffle()
        button1.setTitle("\(numberArray[0])", for: .normal)
        button2.setTitle("\(numberArray[1])", for: .normal)
        button3.setTitle("\(numberArray[2])", for: .normal)
        button4.setTitle("\(numberArray[3])", for: .normal)
        button5.setTitle("\(numberArray[4])", for: .normal)
        button6.setTitle("\(numberArray[5])", for: .normal)
        button7.setTitle("\(numberArray[6])", for: .normal)
        button8.setTitle("\(numberArray[7])", for: .normal)
        button9.setTitle("\(numberArray[8])", for: .normal)
    }

    

   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
