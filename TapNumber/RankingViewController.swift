//
//  RankingViewController.swift
//  TapNumber
//
//  Created by チップまん on 2020/09/28.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController {
    
    let defaults: UserDefaults = UserDefaults.standard
        
    var number: Int = 0
    var number1: Int = 0
    var number2: Int = 0
    var number3: Int = 0

    @IBOutlet var RankLabel1:UILabel!
    @IBOutlet var RankLabel2:UILabel!
    @IBOutlet var RankLabel3:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
                
        RankLabel1.text = String(defaults.integer(forKey: "score1"))
        RankLabel2.text = String(defaults.integer(forKey: "score2"))
        RankLabel3.text = String(defaults.integer(forKey: "score3"))
        }

        // Do any additional setup after loading the view.
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
