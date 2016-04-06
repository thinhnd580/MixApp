//
//  ViewController.swift
//  MixApp
//
//  Created by Thinh Nguyen on 4/4/16.
//  Copyright © 2016 Thinh Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtViewContent: UITextView!
    @IBOutlet weak var btnDone: UIButton!
    var index = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("index path is \(self.index)")
        switch self.index {
        case 0:
            self.txtViewContent.text="This application is developed by thjnh195 . I hope that it will help you have a good time"
            break
        case 1:
            self.txtViewContent.text="This application uses: AVFoundation for audio player"
            break
        case 2:
            self.txtViewContent.text="Comming soon"
            break
        default:
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnDoneClicked(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}

