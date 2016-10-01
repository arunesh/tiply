//
//  ViewController.swift
//  tiply
//
//  Created by Arunesh Mishra on 9/24/16.
//  Copyright © 2016 Arunesh Mishra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tiplabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("default_tip") ?? 0
        tipControl.selectedSegmentIndex = intValue
        
    }
    
    override func viewDidAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("default_tip") ?? 0
        tipControl.selectedSegmentIndex = intValue
        calculateTip(tipControl)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTip(sender: AnyObject) {
        let tipPercentages = [0.18, 0.20, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tiplabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

