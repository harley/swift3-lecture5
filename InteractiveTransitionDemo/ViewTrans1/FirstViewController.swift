//
//  ViewController.swift
//  ViewTrans1
//
//  Created by Harley Trung on 4/4/16.
//  Copyright © 2016 coderschool.vn. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var animator = MyAnimator()

    @IBAction func onButton(sender: AnyObject) {
        print("let's go")
    }

    @IBAction func onPinch(sender: UIPinchGestureRecognizer) {
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("set transitioningDelegate")
    }
}

class MyAnimator: NSObject, UIViewControllerTransitioningDelegate {
    let DURATION: NSTimeInterval = 1
    var isPresenting = false
    var interactiveTransitioning: UIPercentDrivenInteractiveTransition!
    var isInteractive = false

//    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        print("presenting")
//    }

//    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        print("dimissing")
//    }

    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if isInteractive {
            // ...
        }

        return nil
    }
    
//    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//
//    }

}

extension MyAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return DURATION
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        print("animating")
        // let containerView =
        // let fromVC =
        // let toVC =

        if isPresenting {
            // animate adding toVC.view into containerView
        } else {
            // animate removing fromVC.view from containerView
        }
    }
}