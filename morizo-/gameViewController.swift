//
//  secondViewController.swift
//  Sw1-1
//
//  Created by 比嘉　盛哉 on 11/16/15.
//  Copyright © 2015 modeling. All rights reserved.
//

import UIKit


class GameViewController: UIViewController {
    
    
    // 時間計測用の変数(制限時間).
    var cnt : Float = 11
    // count変数.
    var count : Float = 0.0
    // timer,countのラベル設定.
    var timerLabel : UILabel!
    var countLabel : UILabel!
    // タイマー設定.
    var time : NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        var swipeDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
        
        // 背景色を設定.
        view.backgroundColor = UIColor.whiteColor()
        
        // touchボタンを作成.
     /* let touchButton: UIButton = UIButton(frame: CGRectMake(0,0,200,70))
        touchButton.backgroundColor = UIColor.blueColor();
        touchButton.layer.masksToBounds = true
        touchButton.setTitle("touch", forState: .Normal)
        touchButton.layer.cornerRadius = 20.0
        touchButton.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height-200)
        touchButton.addTarget(self, action: "onClicktouchButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(touchButton);  */
        
       
        
        
        // countLabelを作る.
        countLabel = UILabel(frame: CGRectMake(0,0,200,50))
        countLabel.layer.masksToBounds = true
        countLabel.layer.cornerRadius = 20.0
        countLabel.text = "Score : ".stringByAppendingFormat("%.0f",count)+"パカ"
        countLabel.textColor = UIColor.blackColor()
        countLabel.shadowColor = UIColor.grayColor()
        countLabel.textAlignment = NSTextAlignment.Center
        countLabel.layer.position = CGPoint(x: self.view.bounds.width*3/4,y:self.view.bounds.height*1/8)
        self.view.addSubview(countLabel)

        // timerLabelを作る.
        timerLabel = UILabel(frame: CGRectMake(0,0,200,50))
        timerLabel.layer.masksToBounds = true
        timerLabel.layer.cornerRadius = 20.0
        timerLabel.text = "\(cnt)"
        timerLabel.textColor = UIColor.blackColor()
        timerLabel.shadowColor = UIColor.grayColor()
        timerLabel.textAlignment = NSTextAlignment.Center
        timerLabel.layer.position = CGPoint(x: self.view.bounds.width*1/4,y:self.view.bounds.height*1/8)
        self.view.addSubview(timerLabel)
        // タイマーを作る.
        time = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
        NSTimer.scheduledTimerWithTimeInterval(10.5, target: self, selector:Selector("timer"), userInfo: nil, repeats: true)
    }
    
    
    // countLabelの更新.
    func updatecountLabel(count: Float){
        countLabel.text = String(count)
    }
    
    
    // countの設定.
    func onClickMyBottun(sender: UIButton){
        count++
        let str2 = "Score : ".stringByAppendingFormat("%.0f",count)+"パカ"
        updatecountLabel(count)
        countLabel.text = str2
        if count >= 0.0 {
            let count2 = NSUserDefaults.standardUserDefaults()
            count2.setInteger(Int(count), forKey: "count")
        }
    }
    
    
    
    
    // timeボタンイベント.
    internal func timer(){
        // 遷移するViewを定義.
        let sardViewController: UIViewController = ScoreViewController()
        // アニメーションを設定.
        sardViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        // Viewの移動.
        self.presentViewController(sardViewController, animated: true, completion: nil)
        // timerを止める
        if cnt == 0 && time.valid == true {
            //timerを破棄する.
            time.invalidate()
        }
}

    
    // NSTimerIntervalで指定された秒数毎に呼び出されるメソッド.
    func onUpdate(timer : NSTimer){
        cnt -= 0.1
        // 桁数を指定して文字列を作る.
        if cnt >= 0 {
            let str = "TIME : ".stringByAppendingFormat("%.0f",cnt)
            timerLabel.text = str}
    }
    
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                print("Swiped right")
            case UISwipeGestureRecognizerDirection.Down:
                print("Swiped down")
            count++
                let str2 = "Score : ".stringByAppendingFormat("%.0f",count)+"パカ"
                updatecountLabel(count)
                countLabel.text = str2
            if count >= 0.0 {
                let count2 = NSUserDefaults.standardUserDefaults()
                count2.setInteger(Int(count), forKey: "count")
                }

            case UISwipeGestureRecognizerDirection.Left:
                print("Swiped left")
            case UISwipeGestureRecognizerDirection.Up:
                print("Swiped up")
            default:
                break
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}