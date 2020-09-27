//
//  ResultViewController.swift
//  TapNumber
//
//  Created by チップまん on 2020/09/27.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var number: Int = 0
      
    let defaults: UserDefaults = UserDefaults.standard

    @IBOutlet var ResultScore: UILabel!
      
    override func viewDidLoad() {
        super.viewDidLoad()

          
        ResultScore.text = String(number)
          
         
          // Do any additional setup after loading the view.
      }
    
    @IBAction func goBackToGame(){
          self.dismiss(animated: true, completion: nil)
          
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
