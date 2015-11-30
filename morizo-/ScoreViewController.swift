//
//  ViewController.swift
//  Sw1-1
//
//  Created by 比嘉　盛哉 on 11/16/15.
//  Copyright © 2015 modeling. All rights reserved.
//

import UIKit


class ScoreViewController: UIViewController {
    
    var ScoreLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let count2 = NSUserDefaults.standardUserDefaults()
        let score = count2.integerForKey("count")
        
        // 背景色を設定.
        view.backgroundColor = UIColor.whiteColor()
        
        // 文字を書く為のlabelを作成
        let ScoreLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,150))
        // 入力する文字を書く
        ScoreLabel.text = "\(score)パカ"
        // 文字の大きさを指定する
        ScoreLabel.font = UIFont.systemFontOfSize(CGFloat(40))
        // 文字の色を白にする.
        ScoreLabel.textColor = UIColor.blackColor()
        // 文字の影の色をグレーにする.
        ScoreLabel.shadowColor = UIColor.whiteColor()
        // Textを中央寄せにする.
        ScoreLabel.textAlignment = NSTextAlignment.Center
        // 配置する座標を設定する.
        ScoreLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)
        // ViewにLabelを追加.
        self.view.addSubview(ScoreLabel)
        
        // TOPボタンを作成.
        let topButton: UIButton = UIButton(frame: CGRectMake(0,0,90,30))
        topButton.backgroundColor = UIColor.redColor();
        topButton.layer.masksToBounds = true
        topButton.setTitle("TOP", forState: .Normal)
        topButton.layer.cornerRadius = 0.0
        topButton.layer.position = CGPoint(x: self.view.bounds.width*1/5 , y:self.view.bounds.height*1/10)
        topButton.addTarget(self, action: "onClickTopButton:", forControlEvents: .TouchUpInside)
        topButton.tag = 1
        self.view.addSubview(topButton);
        
        // REPLAYボタンを作成.
        let replayButton: UIButton = UIButton(frame: CGRectMake(0,0,250,100))
        replayButton.backgroundColor = UIColor.redColor();
        replayButton.layer.masksToBounds = true
        replayButton.setTitle("REPLAY", forState: .Normal)
        replayButton.layer.cornerRadius = 20.0
        replayButton.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height-200)
        replayButton.addTarget(self, action: "onClickReplayButton:", forControlEvents: .TouchUpInside)
        replayButton.tag = 2
        self.view.addSubview(replayButton);
    }
    
    
    internal func onClickTopButton(sender: UIButton){
        // 遷移するViewを定義する.
        let ViewController: UIViewController = TopViewController()
        // アニメーションを設定する.
        ViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        // Viewの移動する.
        self.presentViewController(ViewController, animated: true, completion: nil)
    }
    
    
    internal func onClickReplayButton(sender: UIButton){
        // 遷移するViewを定義する.
        let ViewController: UIViewController = GameViewController()
        // アニメーションを設定する.
        ViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        // Viewの移動する.
        self.presentViewController(ViewController, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
