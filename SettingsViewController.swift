//
//  SettingsViewController.swift
//  tiply
//
//  Created by Arunesh Mishra on 9/30/16.
//  Copyright © 2016 Arunesh Mishra. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipSelector: UISegmentedControl!
    
    @IBAction func onSave(sender: AnyObject) {
        let defaultTip = defaultTipSelector.selectedSegmentIndex
        print("Saving \(defaultTip)")
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTip, forKey: "default_tip")
        defaults.synchronize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("default_tip") ?? 0
        print ("Got \(intValue)")
        defaultTipSelector.selectedSegmentIndex = intValue
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
