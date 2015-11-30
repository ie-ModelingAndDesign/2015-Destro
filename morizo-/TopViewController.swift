//
//  ViewController.swift
//  Sw1-1
//
//  Created by 比嘉　盛哉 on 11/16/15.
//  Copyright © 2015 modeling. All rights reserved.
//

import UIKit


class TopViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景色を設定.
        view.backgroundColor = UIColor.whiteColor()
        
        // 文字を書く為のlabelを作成
        let titleLabel: UILabel = UILabel(frame: CGRectMake(0,0,500,500))
        // 入力する文字を書く
        titleLabel.text = "Mac Snap!!"
        // 文字の大きさを指定する
        titleLabel.font = UIFont.systemFontOfSize(CGFloat(50))
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
        destroLabel.font = UIFont.systemFontOfSize(CGFloat(30))
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

        // Startボタンを作成.
        let startButton: UIButton = UIButton(frame: CGRectMake(0,0,200,70))
        startButton.backgroundColor = UIColor.redColor();
        startButton.layer.masksToBounds = true
        startButton.setTitle("START", forState: .Normal)
        startButton.layer.cornerRadius = 20.0
        startButton.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height-200)
        startButton.addTarget(self, action: "onClickStartButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(startButton);
    }
    
    
    internal func onClickStartButton(sender: UIButton){
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
