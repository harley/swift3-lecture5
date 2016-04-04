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
        if sender.state == .Began {
            print("began")
            performSegueWithIdentifier("secondSegue", sender: self)
        }

        if sender.state == .Changed {
            let percent = (sender.scale - 1) / 5
            print("changing. scale", sender.scale, "percent", percent)
            animator.interactiveTransitioning.updateInteractiveTransition(percent)
        }

        if sender.state == .Ended {
            print("done")
            if sender.velocity > 0 {
                animator.interactiveTransitioning.finishInteractiveTransition()
            } else {
                animator.interactiveTransitioning.cancelInteractiveTransition()
            }
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc = segue.destinationViewController 
        vc.transitioningDelegate = animator
        vc.modalPresentationStyle = UIModalPresentationStyle.Custom
        if segue.identifier == "secondSegue" {
            animator.isInteractive = true
        }
    }
}

class MyAnimator: NSObject, UIViewControllerTransitioningDelegate {
    let DURATION: NSTimeInterval = 1
    var isPresenting = false
    var interactiveTransitioning: UIPercentDrivenInteractiveTransition!
    var isInteractive = false

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        print("presenting")
        isPresenting = true
        return self
    }

    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        print("dimissing")
        isPresenting = false
        return self
    }

    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if isInteractive {
            print("set interactiveTransitioning")
            interactiveTransitioning = UIPercentDrivenInteractiveTransition()
            return interactiveTransitioning
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
        let containerView = transitionContext.containerView()!
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!

        if isPresenting {
            print("setting alpha for toVC", toVC)
            toVC.view.alpha = 0
            toVC.view.transform = CGAffineTransformMakeScale(0, 0)
            containerView.addSubview(toVC.view)
            UIView.animateWithDuration(DURATION, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 10, options: [], animations: { 
                toVC.view.alpha = 1
                toVC.view.transform = CGAffineTransformMakeScale(0.9, 0.9)
                }) { (finished) in
                    transitionContext.completeTransition(true)
                }
        } else {
            fromVC.view.alpha = 1
            // dismissing
            UIView.animateWithDuration(DURATION, animations: {
                fromVC.view.alpha = 0
                fromVC.view.transform = CGAffineTransformMakeScale(0.01, 0.01)
                }, completion: { (succeeded) in
                    transitionContext.completeTransition(true)
                    fromVC.view.removeFromSuperview()
            })
        }
    }
}