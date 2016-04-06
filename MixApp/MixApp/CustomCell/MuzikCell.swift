//
//  MuzikCell.swift
//  MixApp
//
//  Created by Thinh Nguyen on 4/4/16.
//  Copyright © 2016 Thinh Nguyen. All rights reserved.
//

import UIKit

class MuzikCell: UICollectionViewCell {

    
    
    @IBOutlet weak var sliderVolume: UISlider!
    @IBOutlet weak var btnIcon: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.sliderVolume.transform=CGAffineTransformMakeScale(0.3, 0.3);
        
    }
    @IBAction func btnClicked(sender: AnyObject) {
        
    }
    override func prepareForReuse() {
        
        self.btnIcon.setBackgroundImage(nil, forState: (UIControlState.Selected) ) ;
    }
    
}
