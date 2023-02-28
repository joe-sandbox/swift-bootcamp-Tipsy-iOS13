//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Horst Josef Grenz Meza on 2/28/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var tip : Float = 0.0
    var bill : Float = 0.0
    var numPeople : Int = 2
    var total : Float = 0.0
    var pctValue : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.totalLabel.text = String(format: "%.2f",self.total)
        self.settingLabel.text = settingMessage(numPeople: self.numPeople, pctValue: self.pctValue)
        // Do any additional setup after loading the view.
    }
    
    func settingMessage(numPeople: Int,pctValue:Int)->String{
        return "Split between \(numPeople), with \(pctValue)%  tip."
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
