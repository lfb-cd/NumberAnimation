//
//  ViewController.swift
//  NumberAnimation
//
//  Created by lifubing on 15/3/28.
//  Copyright (c) 2015年 lifubing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    @IBAction func but(sender: UIButton) {
        let LabelAnimation1 = NumberAnimation(label: label1, TotheValue: "19874")
        let LabelAnimation2 =  NumberAnimation(label: label2, TotheValue: "2819")
        let LabelAnimation3 =  NumberAnimation(label: label3, TotheValue: "638")
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

