//
//  ViewController.swift
//  MixApp
//
//  Created by Thinh Nguyen on 4/4/16.
//  Copyright © 2016 Thinh Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnDone: UIButton!
    var index:[Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnDoneClicked(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}

