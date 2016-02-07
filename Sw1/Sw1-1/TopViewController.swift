//
//  ViewController.swift
//  Sw1-1
//
//  Created by 比嘉　盛哉 on 11/16/15.
//  Copyright © 2015 modeling. All rights reserved.
//

import UIKit
import AVFoundation

class TopViewController: UIViewController{
    
    var font:UIFont!
    
    var TopBGMPlayer:AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let audioPath = NSBundle.mainBundle().pathForResource("BGM", ofType: "mp3")!
        do{
            try TopBGMPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
            TopBGMPlayer.play()
            TopBGMPlayer.numberOfLoops = -1
            print("TopBGM.Play")
        }catch{
            print("Music stop")
        }
        
        // 背景色を設定.
        view.backgroundColor = UIColor.whiteColor()
        
        
        //背景に画像を挿入
        let myImage: UIImage = UIImage(named: "apple.png")!
        let myImageView: UIImageView = UIImageView()
        //let width = self.myImage!.size.width
        myImageView.image = myImage
        myImageView.frame = CGRectMake(self.view.bounds.width/2-myImage.size.width/3, self.view.bounds.height/2-myImage.size.height/3-150, myImage.size.width/2+55, myImage.size.height/2+60)
            self.view.addSubview(myImageView)
        
        
        // 文字を書く為のlabelを作成
        let titleLabel: UILabel = UILabel(frame: CGRectMake(0,0,500,500))
        // 入力する文字を書く
        titleLabel.text = "Mac Snap!!"
        // 文字の大きさを指定する
        titleLabel.font = UIFont(name:"PAPERWORKBlack",size:80)
        // 文字の色を白にする.
        titleLabel.textColor = UIColor.blackColor()
        // 文字の影の色をグレーにする.
        titleLabel.shadowColor = UIColor.whiteColor()
        // Textを中央寄せにする.
        titleLabel.textAlignment = NSTextAlignment.Center
        // 配置する座標を設定する.
        titleLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)
        // ViewにLabelを追加.
        self.view.addSubview(titleLabel)

        // 文字を書く為のlabelを作成
        let destroLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,150))
        // 入力する文字を書く
        destroLabel.text = "By destro"
        // 文字の大きさを指定する
        //destroLabel.font = UIFont.systemFontOfSize(CGFloat(30))
        destroLabel.font = UIFont(name:"PAPERWORKBlack",size:30)
        // 文字の色を白にする.
        destroLabel.textColor = UIColor.blackColor()
        // 文字の影の色をグレーにする.
        destroLabel.shadowColor = UIColor.whiteColor()
        // Textを中央寄せにする.
        destroLabel.textAlignment = NSTextAlignment.Center
        // 配置する座標を設定する.
        destroLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200+50)
        // ViewにLabelを追加.
        self.view.addSubview(destroLabel)
        
        
//        // Startボタンを作成.
//        let startButton: UIButton = UIButton(frame: CGRectMake(0,0,400,900))
//        //startButton.backgroundColor = UIColor.redColor();
//        startButton.layer.masksToBounds = true
//        //startButton.setTitle("START", forState: .Normal)
//        //startButton.titleLabel?.font = UIFont(name:"PAPERWORKDots",size:20)
//        startButton.layer.cornerRadius = 20.0
//        startButton.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height-200)
//        startButton.addTarget(self, action: "onClickStartButton:", forControlEvents: .TouchUpInside)
//        self.view.addSubview(startButton);
        
        //りんごボタン
        let startButton: UIButton = UIButton(frame: CGRectMake(0,0,130,140))
        var buttonImage:UIImage = UIImage(named: "apple.png")!;
        startButton.setTitle("START", forState: UIControlState.Normal);
        startButton.titleLabel?.font = UIFont(name:"PAPERWORKBlack",size:30);
        startButton.setBackgroundImage(buttonImage, forState: UIControlState.Normal);
        startButton.addTarget(self, action: "onClickStartButton:", forControlEvents: .TouchUpInside)//*
        startButton.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height-200)
        self.view.addSubview(startButton);

    }
    
    
    internal func onClickStartButton(sender: UIButton){
        TopBGMPlayer.stop()
        print("TopBGM.Stop")
        print("go to gameView")
        // 遷移するViewを定義する.
        let secondViewController: UIViewController = GameViewController()
        // アニメーションを設定する.
        secondViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        // Viewの移動する.
        self.presentViewController(secondViewController, animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

