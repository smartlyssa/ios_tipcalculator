//
//  SettingsViewController.swift
//  tips
//
//  Created by Lyssa on 9/6/15.
//  Copyright (c) 2015 thegeekgoddess.net. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
   
    @IBOutlet var defaultTipSegControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTipIndex : Int = 0
        
        if (defaults.objectForKey("defaultTipValue") != nil) {
            defaultTipIndex = defaults.integerForKey("defaultTipValue")
            print("defaultTipIndex: \(defaultTipIndex)")
        }
        defaultTipSegControl.selectedSegmentIndex = defaultTipIndex
        
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
    @IBAction func goBack(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func changeDefaultTip(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger(defaultTipSegControl.selectedSegmentIndex, forKey: "defaultTipValue")
        defaults.synchronize()
        
    }
  

}
