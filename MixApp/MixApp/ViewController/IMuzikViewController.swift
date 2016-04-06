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
    var filenames:[String] = ["audiowave","cafe","fan","fire","forrest","leaves","moon","rain","seaside","thunderstorm","train","water","waterstream"]
    var players:[AVAudioPlayer] = []
    var btnArray:[UIButton] = []
    var sliderArray:[UISlider] = []
    
    override func viewWillAppear(animated: Bool) {
        
    }
    //thinh 040416
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.collectionView.backgroundColor=UIColor.clearColor();
        collectionView!.registerNib(UINib(nibName: "MuzikCell", bundle: nil), forCellWithReuseIdentifier: "MuzikCell")
        
        
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
        
        //catch event slider editting
        cell.sliderVolume.tag=indexPath.row
        cell.sliderVolume.addTarget(self, action: #selector(IMuzikViewController.onSliderMoving(_:)), forControlEvents: UIControlEvents.TouchDragInside)
        self.sliderArray.insert(cell.sliderVolume, atIndex: indexPath.row)
        
        cell.btnIcon.tag=indexPath.row;
        cell.btnIcon.addTarget(self, action: #selector(IMuzikViewController.soundClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        if(self.players.count<self.filenames.count){
            //First time create cell
            cell.btnIcon.setBackgroundImage(UIImage.init(named: self.filenames[indexPath.row] + ".png" )?.alpha(0.35), forState: UIControlState.Normal)
            //create player for cell
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource( self.filenames[indexPath.row]  , ofType:  ".mp3")! )
            do{
                let player = try AVAudioPlayer(contentsOfURL:url)
                    players.insert(player, atIndex: indexPath.row)
                    //            player.numberOfLoops = -1
                    player.prepareToPlay()
                    player.play()
                    player.stop()
                
                
                
            }
            catch{
                print("Error");
            }
        }
        else{
            //change state of button
            if((self.players[indexPath.row] ).playing){
                let bgSelected=UIImage.init(named: self.filenames[indexPath.row] + ".png")?.alpha(1)
                cell.btnIcon.setBackgroundImage(bgSelected, forState: UIControlState.Normal)
            }
            else{
                cell.btnIcon.setBackgroundImage(UIImage.init(named: self.filenames[indexPath.row] + ".png" )?.alpha(0.35), forState: UIControlState.Normal)
                
            }
            

        }
        
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
        //change to play/stop state

        print("clicked \(sender.tag)")
        
        //get player
        let player = players[sender.tag]
        
        if(player.playing){
            sender.setBackgroundImage(UIImage.init(named: self.filenames[sender.tag] + ".png" )?.alpha(0.35), forState: UIControlState.Normal)
            player.stop()
        }
        else{
            let bgSelected=UIImage.init(named: self.filenames[sender.tag] + ".png")?.alpha(1)
            sender.setBackgroundImage(bgSelected, forState: UIControlState.Normal)
            player.play()
        }
        
        
    }
    
    
    //thinh 040416
    @IBAction func btnPlayStopAllClicked(sender: AnyObject) {
        

        print("Number of players \(players.count)")
        
        
        let count = self.filenames.count-1
        
        //change to playall
        if !self.btnPlayStopAll.selected {
            
            for index in 0...count{
                print(index)
                let player = self.players[index]
                if(!player.playing){
                    player.play()
                    self.collectionView.reloadItemsAtIndexPaths([NSIndexPath].init(arrayLiteral: NSIndexPath.init(forRow: index, inSection: 0)))
                }
                
                
            }

        }
            
        //change to stop all
        else{
            for index in 0...count{
                let player = self.players[index]
//                cell.btnIcon.selected=false;
                if(player.playing){
                    player.stop()
                    self.collectionView.reloadItemsAtIndexPaths([NSIndexPath].init(arrayLiteral: NSIndexPath.init(forRow: index, inSection: 0)))
                }
            }
        }
        self.btnPlayStopAll.selected = !self.btnPlayStopAll.selected
        
    }
    func onSliderMoving(sender: UISlider){
//        print(sender.tag)
//        print(sender.value)
        
        //change volume
        let player = players[sender.tag]
        player.volume = sender.value
    }
    

    
}
