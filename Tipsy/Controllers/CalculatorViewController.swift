//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var numPeople: Double = 2
    var pctValue = 10
    var tip : Float = 0.0
    var bill : Float = 0.0
    var total : Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func calculateTip( pctTip: Int,bill:Float)->Float{
        print("Calculating tip pctTip[\(pctTip)]/100:\(Float(pctTip)/Float(100)) bill[\(bill)] = \(bill * Float(pctTip)/Float(100)) ")
        return bill * (Float(pctTip)/Float(100))
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        var selection = [false,true,false]
        var pctValue = 0
        switch sender.currentTitle {
        case "0%":
            selection[0] = true
            selection[1] = false
            selection[2] = false
            pctValue = 0
        case "10%":
            selection[0] = false
            selection[1] = true
            selection[2] = false
            pctValue = 10
        case "20%":
            selection[0] = false
            selection[1] = false
            selection[2] = true
            pctValue = 20
        default:
            selection[0] = false
            selection[1] = true
            selection[2] = false
            pctValue = 10
        }
        zeroPctButton.isSelected = selection[0]
        tenPctButton.isSelected = selection[1]
        twentyPctButton.isSelected = selection[2]
        
        self.pctValue = pctValue
    }
    
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        if sender.value > 0{
            self.numPeople = sender.value
            self.splitNumberLabel.text = "\(Int(self.numPeople))"
        }else{
            self.numPeople = 1
            self.splitNumberLabel.text = "1"
        }
        
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        let billText = billTextField.text ?? "0.0"
        let billValue = Float(billText) ?? 0.0
        let tip = calculateTip(pctTip: pctValue, bill: billValue)
        let total = Float(tip+billValue)/Float(self.numPeople)
        
        
        self.bill = billValue
        self.tip = tip
        self.total = total
        
        print("bill:$\(self.bill) tip%:\(self.pctValue) tip$:\(self.tip) # People: \(self.numPeople) Total:\(self.total)")
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destVC = segue.destination as! ResultsViewController
            destVC.total = self.total
            destVC.tip = self.tip
            destVC.numPeople = Int(self.numPeople)
            destVC.bill = self.bill
            destVC.pctValue = self.pctValue
        }
    }
}

