//
//  ViewController.swift
//  ViewDemo
//
//  Created by Harley Trung on 4/4/16.
//  Copyright © 2016 coderschool.vn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var progress: CGFloat = 0
    var progressView: ProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let firstView = MyFirstXib(frame: view.bounds)
        view.addSubview(firstView)
    }

    func setupProgressView() {
        progressView = ProgressView(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: 2))
        progressView.backgroundColor = UIColor.greenColor()
        view.addSubview(progressView)
        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(ViewController.loading(_:)), userInfo: nil, repeats: true)
    }

    func setupNibFirstTry() {
        let nib = UINib(nibName: "MyFirstXib", bundle: nil)
        let objects = nib.instantiateWithOwner(nil, options: nil)
        for object in objects {
            print("checking:", object)
        }

        let view1 = objects[0] as! UILabel
        let view2 = objects[1] as! UIView

        view1.frame.origin.y += 100
        view2.frame.origin.y += 300
        view.addSubview(view1)
        view.addSubview(view2)

        view1.text = "hello"
    }

    func loading(timer: NSTimer) {
        progress += 0.1
        if progress > 1 { timer.invalidate() }
        print("progress", progress)
        progressView.progress = progress
    }
}

