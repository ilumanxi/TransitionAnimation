//
//  ViewController.swift
//  TransitionAnimation
//
//  Created by lumanxi on 15/10/16.
//  Copyright © 2015年 fanfan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    
    let ipadContainerView = UIView(frame: CGRectMake(100, 100, 200, 151.5))
    let ipadView = UIImageView(frame: CGRectMake(0, 0, 200, 151.5))
    let supportIpad = UIView(frame:  CGRectMake(26, 242, 334, 72))
    
    
    let iphoneContainerView = UIView(frame: CGRectMake(70, 150, 75, 140))
    let iphoneView = UIImageView(frame: CGRectMake(0, 0, 75, 140))
    let supportIphone = UIView(frame: CGRectMake(26, 130, 334, 72))
    
    //Container
    let webContainerView = UIView(frame: CGRectMake(160, 220, 200, 151.5))
    let webView = UIImageView(frame: CGRectMake(0, 0, 200, 151.5))
    let supportWeb = UIView(frame: CGRectMake(26, 354, 334, 72))
    
    let textContainerView = UIView()
    let textView = UILabel()
    
    let goView = UIButton(type: UIButtonType.Custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ipadView.image = UIImage(named: "ipad")
//        ipadContainerView.addSubview(ipadView)
        supportIpad.backgroundColor = UIColor.greenColor()
        
        iphoneView.image = UIImage(named: "iphone")
//        iphoneContainerView.addSubview(iphoneView)
        supportIphone.backgroundColor = UIColor.yellowColor()
        
        webView.image = UIImage(named: "web")
//        webContainerView.addSubview(webView)
        supportWeb.backgroundColor = UIColor.purpleColor()
        
        textView.numberOfLines = 2;
        textView.textColor = UIColor.whiteColor()
        textView.textAlignment = .Center
        textView.text = "Welcome to FengQiXi\n  this your transition animation";
        textView.sizeToFit()
//        textContainerView.addSubview(textView)
        textContainerView.frame = CGRectMake(0, 0, textView.bounds.width, textView.bounds.height)
        textContainerView.center = CGPointMake(view.center.x, 460)
        
        
        goView.setTitle("go", forState: .Normal)
        goView.sizeToFit()
        goView.center = CGPointMake(view.center.x, textContainerView.frame.origin.y + 60)
        goView.addTarget(self, action: "go", forControlEvents: .TouchUpInside)
        
        
        containerView.addSubview(ipadContainerView)
        containerView.addSubview(iphoneContainerView)
        containerView.addSubview(webContainerView)
        containerView.addSubview(textContainerView)
    }

    
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        /*
        参数：
            view：第一个参数，也就是作用视图，一般都是容器视图。
            duration：动画持续时间。
            options：过渡转变动画选项，由它来确定过渡转变的具体展现形式。
            animations：动画闭包。
            completion：动画结束后执行该闭包中的代码。
        */
//        UIView.transitionWithView(self.containerView, duration: 1.5, options: .TransitionFlipFromBottom, animations: {
//            self.containerView.addSubview(self.ipadContainerView)
//            self.containerView.addSubview(self.iphoneContainerView)
//            self.containerView.addSubview(self.webContainerView)
//        }, completion: nil)
        
        
//        UIView.transitionWithView(self.ipadContainerView, duration: 1.5, options: [.CurveEaseOut, .TransitionFlipFromBottom], animations: {
//            self.ipadContainerView.addSubview(self.ipadView)
//        }, completion: nil)
//        
//        UIView.transitionWithView(self.iphoneContainerView, duration: 1.5, options: [.CurveEaseOut, .TransitionFlipFromLeft], animations: {
//            self.iphoneContainerView.addSubview(self.iphoneView)
//        }, completion: nil)
//        
//        UIView.transitionWithView(self.webContainerView, duration: 1.5, options: [.CurveEaseOut, .TransitionFlipFromRight], animations: {
//            self.webContainerView.addSubview(self.webView)
//        }, completion: nil)
//        
//        UIView.transitionWithView(self.textContainerView, duration: 2, options: [.CurveEaseOut, .TransitionCrossDissolve], animations: {
//            self.textContainerView.addSubview(self.textView)
//        }, completion: nil)
        
        
        
        
        delay(0, completion: {
            UIView.transitionWithView(self.ipadContainerView, duration: 1.5, options: [.CurveEaseOut, .TransitionFlipFromBottom], animations: {
                self.ipadContainerView.addSubview(self.ipadView)
            }, completion: nil)
        })
        delay(1, completion: {
            UIView.transitionWithView(self.iphoneContainerView, duration: 1.5, options: [.CurveEaseOut, .TransitionFlipFromLeft], animations: {
                self.iphoneContainerView.addSubview(self.iphoneView)
            }, completion: nil)

        })
        delay(2, completion: {
            UIView.transitionWithView(self.webContainerView, duration: 1.5, options: [.CurveEaseOut, .TransitionFlipFromRight], animations: {
                self.webContainerView.addSubview(self.webView)
            }, completion: nil)
        })
        delay(3, completion: {
            UIView.transitionWithView(self.textContainerView, duration: 2, options: [.CurveEaseOut, .TransitionCrossDissolve], animations: {
                self.textContainerView.addSubview(self.textView)
            }, completion: nil)
        })
        
        delay(4, completion: {
            UIView.transitionWithView(self.containerView, duration: 2, options: [.CurveEaseOut, .TransitionCrossDissolve], animations: {
                self.containerView.addSubview(self.goView)
            }, completion: nil)
        })
        
        
        
        //是不是有点儿意思！不过细心的朋友应该发现了，过渡转变动画的方法没有delay这个很有用的属性，这就导致过渡转变动画都是同时发生，不能设置延迟时间。不过我们可以曲线救国，自己写一个delay方法：
    }
    
    
    func delay(seconds: Double, completion:()->()) {
        let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
        dispatch_after(popTime, dispatch_get_main_queue()) {
            completion()
        }
    }
    
    
    func go(){
        
        UIView.animateWithDuration(5, animations: {
            self.containerView.backgroundColor = UIColor(red: 252.0/255.0, green: 155.0/255.0, blue: 65.0/255.0, alpha: 1)
        })
        
        /*
        参数：
        
        fromView：被替换的视图。
        toView：替换之后的视图。
        duration：动画持续时间。
        options：动画选项。
        completion：动画执行结束后执行该闭包中的代码。
        要注意的是该方法的作用视图可以是容器视图，也可以是目标视图。编译运行看看效果：
        */
        UIView.animateWithDuration(1, delay: 0, options: [], animations: {
            self.iphoneView.frame = CGRectMake(0, 0, 334, 72)
            self.iphoneContainerView.frame = CGRectMake(26, 130, 334, 72)
            }, completion: {
                (flag: Bool) in
                if flag {
                    UIView.transitionFromView(self.iphoneContainerView, toView: self.supportIphone, duration: 0.33, options: .TransitionCrossDissolve, completion: nil)
                }
        })
        
        UIView.animateWithDuration(1, delay: 1, options: [], animations: {
            self.ipadView.frame = CGRectMake(0, 0, 334, 72)
            self.ipadContainerView.frame = CGRectMake(26, 242, 334, 72)
            }, completion: {
                (flag: Bool) in
                if flag {
                    UIView.transitionFromView(self.ipadContainerView, toView: self.supportIpad, duration: 0.33, options: .TransitionCrossDissolve, completion: nil)
                }
        })
        
        UIView.animateWithDuration(1, delay: 2, options: [], animations: {
            self.webView.frame = CGRectMake(0, 0, 334, 72)
            self.webContainerView.frame = CGRectMake(26, 354, 334, 72)
            }, completion: {
                (flag: Bool) in
                if flag {
                    UIView.transitionFromView(self.webContainerView, toView: self.supportWeb, duration: 0.33, options: .TransitionCrossDissolve, completion: nil)
                }
        })
        
        /*
        显示/隐藏视图
        
        过渡转变动画也可以用于显示或隐藏视图，这里给出伪代码供参考：
        */
//        UIView.transitionWithView(self.someContainerView, duration: 1.5, options: [.CurveEaseOut, .TransitionFlipFromBottom], animations: {
//            self.someView.hidden = true
//            // self.someView.hidden = false
//            }, completion: nil)
        
        
        delay(3) { () -> () in
            UIView.transitionWithView(self.textContainerView, duration: 1.5, options: [.CurveEaseOut, .TransitionFlipFromBottom], animations: {
                self.textView.hidden = true
                // self.someView.hidden = false
                }, completion: nil)
        }
        

    }


}

