//
//  secondViewController.swift
//  Sw1-1
//
//  Created by 比嘉　盛哉 on 11/16/15.
//  Copyright © 2015 modeling. All rights reserved.
//


import UIKit
import AVFoundation

class GameViewController: UIViewController {
    
    // game画面BGM
    var GameBGMplayer:AVAudioPlayer = AVAudioPlayer()
    // 効果音
    var efectplayer:AVAudioPlayer = AVAudioPlayer()
    
    // 時間計測用の変数(制限時間).
    var cnt : Float = 11
    // 偏移関数
    var h = 0
    // count変数.
    var count : Float = 0.0
    // 動作変数
    var f = 0
    // timer,countのラベル設定.
    var timerLabel : UILabel!
    var countLabel : UILabel!
    // タイマー設定.
    var time : NSTimer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let audioPath = NSBundle.mainBundle().pathForResource("GAME", ofType: "mp3")!
        do{
            try GameBGMplayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
            //GameBGMplayer.play()
            GameBGMplayer.numberOfLoops = -1
            print("GameBGM.Play")
        }catch{
            print("Music stop")
        }
        
        let audioPath2 = NSBundle.mainBundle().pathForResource("kick1", ofType: "mp3")!
        do{
            try efectplayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath2))
            //efectplayer.play()
            print("efectplayer.Play")
        }catch{
            print("efect stop")
        }
        
        if cnt == 5{
            print("SET TIMER")
        }
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "sideSwipeAction:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "sideSwipeAction:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: "DownSwipeAction:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
        
        // 背景色を設定.
        view.backgroundColor = UIColor.whiteColor()
        
        let i = UIImageView(frame: CGRectMake(15, 200, 350, 250))
        i.image = UIImage(named: "before.png")
        view.addSubview(i)
        
        // touchボタンを作成.
        let endButton: UIButton = UIButton(frame: CGRectMake(0,0,100,35))
        endButton.backgroundColor = UIColor.blueColor();
        endButton.layer.masksToBounds = true
        endButton.setTitle("END", forState: .Normal)
        endButton.layer.cornerRadius = 0.0
        endButton.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height-100)
        endButton.addTarget(self, action: "onClickEndButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(endButton);
        
        // countLabelを作る.
        countLabel = UILabel(frame: CGRectMake(0,0,200,50))
        countLabel.layer.masksToBounds = true
        countLabel.layer.cornerRadius = 0.0
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
        NSTimer.scheduledTimerWithTimeInterval(10.5, target: self, selector:Selector("timer"), userInfo: nil, repeats: false)
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
    
    
    // timerイベント.
    internal func timer(){
        if h == 0 {
            GameBGMplayer.stop()
            efectplayer.stop()
            print("GameBGM.Stop")
            print("go to Score")
            time.invalidate()
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
    }
        
    
    
    // NSTimerIntervalで指定された秒数毎に呼び出されるメソッド.
    func onUpdate(timer : NSTimer){
        cnt -= 0.1
        // 桁数を指定して文字列を作る.
        if cnt >= 0 {
            let str = "TIME : ".stringByAppendingFormat("%.0f",cnt)
            timerLabel.text = str}
    }
    
    
    func DownSwipeAction(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizerDirection.Down:
                efectplayer.play()
                print("Swiped down")
                let b = UIImageView(frame: CGRectMake(15, 200, 350, 250))
                b.image = UIImage(named: "after.png")
                view.addSubview(b)
                if f == 0 {
                    count++
                    f = 1
                    let str2 = "Score : ".stringByAppendingFormat("%.0f",count)+"パカ"
                    updatecountLabel(count)
                    countLabel.text = str2
                    if count >= 0.0 {
                        let count2 = NSUserDefaults.standardUserDefaults()
                        count2.setInteger(Int(count), forKey: "count")
                    }
                }else{
                    break
                }
                default:
                break
            }
        }
    }
    
    
    func sideSwipeAction(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizerDirection.Right:
                efectplayer.stop()
                print("Swiped right")
                let a = UIImageView(frame: CGRectMake(15, 200, 350, 250))
                a.image = UIImage(named: "before.png")
                view.addSubview(a)
                if f == 1{
                    f = 0
                }
                
            case UISwipeGestureRecognizerDirection.Left:
                efectplayer.stop()
                print("Swiped left")
                let a = UIImageView(frame: CGRectMake(15, 200, 350, 250))
                a.image = UIImage(named: "before.png")
                view.addSubview(a)
                if f == 1{
                    f = 0
                }
                
            case UISwipeGestureRecognizerDirection.Up:
                print("Swiped up")
            default:
                break
            }
        }
    }
    
    
    internal func onClickEndButton(sender: UIButton){
        h = 1
        GameBGMplayer.stop()
        efectplayer.stop()
        time.invalidate()
        // 遷移するViewを定義する.
        let ViewController: UIViewController = TopViewController()
        // アニメーションを設定する.
        ViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        // Viewの移動する.
        self.presentViewController(ViewController, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}


