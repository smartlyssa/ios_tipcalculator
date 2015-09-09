//
//  ViewController.swift
//  tips
//
//  Created by Lyssa on 9/5/15.
//  Copyright (c) 2015 thegeekgoddess.net. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var defaults = NSUserDefaults.standardUserDefaults()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        if (defaults.objectForKey("defaultTipValue") != nil) {
            setDefaultTipValue()
        }
        tipControl.selectedSegmentIndex = defaults.integerForKey("defaultTipValue")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18,0.2,0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = String(format: "$%.2f",total)
        
    }
 
    @IBAction func onTap(sender:AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
//        println("view will appear")
        if (defaults.objectForKey("defaultTipValue") != nil) {
            tipControl.selectedSegmentIndex = defaults.integerForKey("defaultTipValue")
        }
    }
//
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        // println("view did appear")
//        
//    }
//
//    override func viewWillDisappear(animated: Bool) {
//        super.viewWillDisappear(animated)
//        println("view will disappear")
//    }
//    
//    override func viewDidDisappear(animated: Bool) {
//        super.viewDidDisappear(animated)
//        println("view did disappear")
//    }
    
    func setDefaultTipValue() {
        defaults.setInteger(0, forKey: "defaultTipValue")
        defaults.synchronize()
    }
    
    
}