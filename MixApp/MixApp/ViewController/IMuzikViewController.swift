//
//  IMuzikViewController.swift
//  MixApp
//
//  Created by Thinh Nguyen on 4/4/16.
//  Copyright © 2016 Thinh Nguyen. All rights reserved.
//

import UIKit
import AVFoundation

class IMuzikViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnPlayStopAll: UIButton!
    var filenames:[String] = ["audiowave","cafe","fan","fire","forrest","leaves","moon","rain","seaside","thunderstorm","train","water"]
    var players:[AVAudioPlayer] = [];
    
    
    override func viewWillAppear(animated: Bool) {
        
    }
    //thinh 040416
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.collectionView.backgroundColor=UIColor.clearColor();
        collectionView!.registerNib(UINib(nibName: "MuzikCell", bundle: nil), forCellWithReuseIdentifier: "MuzikCell")
        let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource( "thunderstorm" , ofType:  ".mp3")! )
        do{
            let player = try AVAudioPlayer(contentsOfURL:url)
            player.prepareToPlay()
//            players.insert(player, atIndex: indexPath.row)
            
            player.play()
        }
        catch{
            print("Error");
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //thinh 040416
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    //thinh 040416
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.filenames.count;
    }
    
    //thinh 040416
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        //Define Cell for indexpath
        let cell = self.collectionView.dequeueReusableCellWithReuseIdentifier("MuzikCell", forIndexPath: indexPath) as! MuzikCell
        
        //Set Normal State
        cell.btnIcon.setBackgroundImage(UIImage.init(named: self.filenames[indexPath.row] + ".png" )?.alpha(0.35), forState: UIControlState.Normal)
        
        //Set Selected State
        let bgSelected=UIImage.init(named: self.filenames[indexPath.row] + ".png")?.alpha(1)
        cell.btnIcon.setBackgroundImage(bgSelected, forState: UIControlState.Selected)
        
        cell.btnIcon.tag=indexPath.row;
        
        //catch event button click
        cell.btnIcon.addTarget(self, action: #selector(IMuzikViewController.soundClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
//        let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource( "thunderstorm" , ofType:  ".mp3")! )
//        do{
//            let player = try AVAudioPlayer(contentsOfURL:url)
//            player.prepareToPlay()
//            players.insert(player, atIndex: indexPath.row)
//            
//            player.play()
//        }
//        catch{
//            print("Error");
//        }
        
        return cell
        
    }
    
    //thinh 040416
    func collectionView(collectionView: UICollectionView,
                          layout collectionViewLayout: UICollectionViewLayout,
                                 sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
      
        let constrain = CGFloat.init(((self.view.frame.width/3) - 50))
        return CGSize.init(width:constrain, height: constrain+50)
    }
    
    
    //thinh 040416
    func soundClicked(sender:UIButton){
        //change state of button
        sender.selected = !sender.selected
        print("clicked \(sender.tag)")
        
        //get player
//        let player = players[sender.tag]
//        
//        if(sender.selected){
//            player.stop()
//        }
//        else{
//            player.play()
//        }
        
    }
    
    
    //thinh 040416
    @IBAction func btnPlayStopAllClicked(sender: AnyObject) {
        

        print("Number of players \(players.count)")
        
        
        let count = self.filenames.count-1
        if !self.btnPlayStopAll.selected {
            
            for index in 0...count{
                print(index)
                let cell = self.collectionView.cellForItemAtIndexPath(NSIndexPath.init(forItem: index, inSection: 0)) as! MuzikCell
                cell.btnIcon.selected=true;
            }

        }
        else{
            for index in 0...count{
                let cell = self.collectionView.cellForItemAtIndexPath(NSIndexPath.init(forItem: index, inSection: 0)) as! MuzikCell
                cell.btnIcon.selected=false;
            }
        }
        self.btnPlayStopAll.selected = !self.btnPlayStopAll.selected
        
    }
    
}
